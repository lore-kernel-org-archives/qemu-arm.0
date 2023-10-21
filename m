Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp488307ejb;
        Sat, 21 Oct 2023 13:23:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAaH5mcLyrSi6lrmx9waxzuU7oo9UqoBdNFSXB2u2W6/vUhklEEHdo7ETLVCbUL5vBsH4z
X-Received: by 2002:ad4:5f4d:0:b0:66d:2b0a:bf0f with SMTP id p13-20020ad45f4d000000b0066d2b0abf0fmr7703845qvg.46.1697919817493;
        Sat, 21 Oct 2023 13:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697919817; cv=none;
        d=google.com; s=arc-20160816;
        b=I0HUU84UnK2WP9BobbcgJ76GDwWam/WTTC7LMEPeZF7YeHGDc7r6PrCrRGA4lDoXWl
         ZSbByTC6aNTIqvKnu9WS8+tWXtaTXpEidohYmFpKiDzwOZIPnEExdetQpp4Q9XPe5pos
         m2VZDWH/iH1SAysdbRXRNTqG/aNp1sADTBVWXfh3qswMpOgaiJstkQMhwgbc/iv9GwZ5
         z2jvBO48eysOiFxUd0fGIo6kJRVbKVi/rgm+SszD2tR3IlIF4YZ8sbY5uYD8AUify75g
         PQAOpLOfftdEVdovVlSVOR5pZdaZujxfQinft5RzzQpv3fo6YlKa1uhF0lSu7OttnS0w
         HQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=El2oYZ6nMdSleaG6DLsXDgOVdZ5Sgms1RKGavpUvqzQ=;
        fh=Y43JBb6jcKtYvC/4w1QxT1Qv8P0QwDYHs39CE4MrX14=;
        b=KfeMkaLRa4hpvEBVOZNX3B5YtBY09rS/OnrhUiJ8pzoCfW3IrTCJrgaV/w1WW0zj/g
         9HHAN0Nh/YRsj7ZfiR1jysO4jnU/wOP2iJ2qQHDynEq5DRVRxe80MvTZKvciUwPG7+Fq
         T/CwOC5REVV8FV+wGTVG3W3YwUb7L/ydj8YjGTUQNCbSb0Y+M7o1b/2qzG+10whl8Csl
         TWYqKnKAxIf+45ZK7HThQ0hw9tPxzmgIjLW6mEh0JQIuGW76GSufbI9MIZfMw5/L0GgG
         jjsQPlwozQzXyRkBW4QkK8bDyHeNf4kGquVDxYOqCdEh2Gu7ZB+asZBcuan8udj0J70n
         jN3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=lYwcgb+k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020ad44b2c000000b0066d11e05b4asi3267095qvw.282.2023.10.21.13.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Oct 2023 13:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=lYwcgb+k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quIVB-0004bf-Ei; Sat, 21 Oct 2023 16:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1quIV9-0004aM-JT; Sat, 21 Oct 2023 16:23:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1quIV5-0001lg-Ec; Sat, 21 Oct 2023 16:23:15 -0400
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39LJlmT5004430; Sat, 21 Oct 2023 20:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=El2oYZ6nMdSleaG6DLsXDgOVdZ5Sgms1RKGavpUvqzQ=;
 b=lYwcgb+kU7mc4nyXaROd54LLHXtYGE8djer/QwWLb+lM+AcjKzh2B1OrqTkT9BfSMD8f
 qjRi/P+vQ8PzN14KEvBoW5Ali96SRam3BqtL+EZrToZ2loKrMg5KaumIubVDgwH0sydi
 bOs0FmTNpTS/LSl9yQGJ7wS1QObcC8iFOSE0uyyW7opEXjy+fnQMRGeTPr7bek3t5dAB
 DbSDLiln6YONaOX4vIFe6ImtGmbXoGufmmBQ0RtLDrA5B/YFBK7rRjkTAzXbXf/Eow84
 uAfooKK+p+BwkWu5vkzFTNfUmf4EYhkML4AjzPrmyksnYhVFsj55+Yv8DJwN0sNuI6tL 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tvn400fyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Oct 2023 20:22:55 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39LKH7SQ005505;
 Sat, 21 Oct 2023 20:22:54 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tvn400fyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Oct 2023 20:22:54 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39LK4paQ007084; Sat, 21 Oct 2023 20:22:53 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tuc27w5hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Oct 2023 20:22:53 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39LKMrwu16515616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 21 Oct 2023 20:22:53 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 454B658055;
 Sat, 21 Oct 2023 20:22:53 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 991B958043;
 Sat, 21 Oct 2023 20:22:51 +0000 (GMT)
Received: from [9.67.95.215] (unknown [9.67.95.215])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sat, 21 Oct 2023 20:22:51 +0000 (GMT)
Message-ID: <26b21483-357e-4382-beb3-7356b445196b@linux.ibm.com>
Date: Sat, 21 Oct 2023 15:22:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] hw/fsi: Introduce IBM's Local bus
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org,
 lvivier@redhat.com, qemu-arm@nongnu.org
References: <20231011151339.2782132-1-ninad@linux.ibm.com>
 <20231011151339.2782132-2-ninad@linux.ibm.com> <ZTDlf2jfj5tYGuSM@redhat.com>
 <1159f076-385b-491c-974e-fe72f850f341@linux.ibm.com>
 <ZTFUx/YiaCKHxwf7@redhat.com>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <ZTFUx/YiaCKHxwf7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rxNXo2P36wLZPqfXvnoQjI8JeOkxVUBc
X-Proofpoint-ORIG-GUID: 6rYs3lQkfUH73VgQC7vrIzxLs7iCjzDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-21_12,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=969 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310210187
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oP6ZZKz79Un7

Hello Daniel,

On 10/19/23 11:09, Daniel P. Berrangé wrote:
> On Thu, Oct 19, 2023 at 10:34:52AM -0500, Ninad Palsule wrote:
>> Hello Daniel,
>>
>> On 10/19/23 03:14, Daniel P. Berrangé wrote:
>>> On Wed, Oct 11, 2023 at 10:13:30AM -0500, Ninad Palsule wrote:
>>>> This is a part of patchset where IBM's Flexible Service Interface is
>>>> introduced.
>>>>
>>>> The LBUS is modelled to maintain the qdev bus hierarchy and to take
>>>> advantage of the object model to automatically generate the CFAM
>>>> configuration block. The configuration block presents engines in the
>>>> order they are attached to the CFAM's LBUS. Engine implementations
>>>> should subclass the LBusDevice and set the 'config' member of
>>>> LBusDeviceClass to match the engine's type.
>>>>
>>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>>>> ---
>>>> v2:
>>>> - Incorporated Joel's review comments.
>>>> v5:
>>>> - Incorporated review comments by Cedric.
>>>> ---
>>>>    include/hw/fsi/lbus.h | 51 +++++++++++++++++++++++++
>>>>    include/qemu/bitops.h |  6 +++
>>>>    hw/fsi/lbus.c         | 87 +++++++++++++++++++++++++++++++++++++++++++
>>>>    hw/Kconfig            |  1 +
>>>>    hw/fsi/Kconfig        |  2 +
>>>>    hw/fsi/meson.build    |  1 +
>>>>    hw/meson.build        |  1 +
>>>>    7 files changed, 149 insertions(+)
>>>>    create mode 100644 include/hw/fsi/lbus.h
>>>>    create mode 100644 hw/fsi/lbus.c
>>>>    create mode 100644 hw/fsi/Kconfig
>>>>    create mode 100644 hw/fsi/meson.build
>>>> +DeviceState *lbus_create_device(FSILBus *bus, const char *type, uint32_t addr)
>>>> +{
>>>> +    DeviceState *dev;
>>>> +    FSILBusNode *node;
>>>> +    BusState *state = BUS(bus);
>>>> +
>>>> +    dev = qdev_new(type);
>>>> +    qdev_prop_set_uint8(dev, "address", addr);
>>>> +    qdev_realize_and_unref(dev, state, &error_fatal);
>>>> +
>>>> +    /* Move to post_load */
>>>> +    node = g_malloc(sizeof(struct FSILBusNode));
>>> This allocation pattern is discouraged in favour of:
>>>
>>>       node = g_new0(FSILBusNode, 1);
>> I am using g_malloc() because I want program to terminate. I don't think
>> g_new0 provide this functionality. Please let me know.
> All the glib memory allocation functions terminate on OOM, except
> for the ones with '_try_' in their name.

Sorry, you are right. I have removed this function as per Cedric's comment.

Thanks for the review.

Regards,

Ninad

>
> With regards,
> Daniel
