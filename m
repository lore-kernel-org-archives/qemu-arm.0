Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp781297ejb;
        Thu, 19 Oct 2023 13:41:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYD0f/RrokEUgWgGlHkaHqjkdzwMsHTvqcxlvIuph2BcNXgacyd0rkLucJF0Tx9cCkUcjp
X-Received: by 2002:a67:c08d:0:b0:457:bac5:ea50 with SMTP id x13-20020a67c08d000000b00457bac5ea50mr68931vsi.25.1697748094720;
        Thu, 19 Oct 2023 13:41:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697748094; cv=none;
        d=google.com; s=arc-20160816;
        b=Uep9CCFnJZNVCCnbyHY4CDyeQ1aa8Hw1vPloEf7RL3khwlV3eiBf0ff/Ej8tFKFb6R
         MC7R2Fx5jsS8CBQiTR4JHcVBj9DfLmFKr+m/zkohk11rUwe40a3NyxeKWQOIu9EBZkkM
         d1EqgqlYzD/fA9j1xRYPy6wFzsy2AkwkQaWbipquyz91Vco72Uy4vnWlRoqp/0B3oiUu
         wCIAEDaqK10taUXp90gCItDtUMZ2xR7qmjj0w6JrG1xAe9c3HyUKUuejCXA0UJUF+8I4
         PgZ19P0S7KAt3/40CskviRx8NhX+bDuauLYnGgc3qWKRaJ4k2gdBpTwjah8tbmn3pvby
         VGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=SmlttsfarnrVBD8Oacd5DN15NmXAkW68aQ44iJkyIUQ=;
        fh=nDcgOyJ5wI4ec5cBWrHogeHeYCn4pzALdxpM3FX1gnA=;
        b=ZKZCTVNty9jnJkPdKNMUdnbS3itPki/sYS0l5Dii9pPuX/8rg3LyB2VZfXgCuAsREn
         X+XfX9S7tKT930JAd3lmpdI3BIiUamGWraUmtr7jVKZNLye3/ou+9JAzxYJ1hVlJ5sGA
         ke7s9xYnzrExgfX+E45vQzxzL249iq2V6aYKiXFVMGVZsijZJp2tQQpJTL+LDwi0v0ND
         HUChZviZtIW7g6qYxNIPfH3ysngjGK/NAeFNyL19zQd4SGwhAo/hT1yF+lu1RxRQPS43
         8ynbzVIWLBzSOA8VErkNy7Sf6W7q4g3prOgoHKloENDXjoup+QVyiyJE2gYXq5GIRapB
         WcLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=lpZWvgXd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020ac8584d000000b00417b42a9c52si206723qth.6.2023.10.19.13.41.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 13:41:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=lpZWvgXd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtZoW-0008Gd-IM; Thu, 19 Oct 2023 16:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1qtZoV-0008G2-LB; Thu, 19 Oct 2023 16:40:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1qtZoT-00086l-Vu; Thu, 19 Oct 2023 16:40:15 -0400
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39JKbFA8026160; Thu, 19 Oct 2023 20:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SmlttsfarnrVBD8Oacd5DN15NmXAkW68aQ44iJkyIUQ=;
 b=lpZWvgXd5BA6eo1Vuif/DWK4KqgttMcys3sYrstKcfhayGZrnfxahH6cjOox9YBsRd3M
 NmpDzdnNrpXcWliUUsS5Vde8MR01sgm/PzDxNH/iT8wmn7sd0kNicj240NY5CQfUNKp5
 Ox23yxMTI9JE69Q2TNFClAmKBQuvL3n575+TFK+ezLsR//g7kwPg0lGu/AKdTzZfLIT7
 6Or+lvzxYivBnHVprseQDqG6UwSZvGbI/IEolrL5K8/HyP+ovBOFgfhRICWjN6fgFd2/
 jL2fwuVWFL/BC05h8KfV3n8yQ9fTj1tp4stPiLCwbxa5OtQmB89/Sa9re/+buxF6IdgB Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tubne05pm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 20:39:55 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39JKbrxw028147;
 Thu, 19 Oct 2023 20:39:54 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tubne05na-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 20:39:54 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39JKLRpV030738; Thu, 19 Oct 2023 20:39:52 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr7hk32n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 20:39:52 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39JKdptn29950638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Oct 2023 20:39:51 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD56F58057;
 Thu, 19 Oct 2023 20:39:51 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AEC558058;
 Thu, 19 Oct 2023 20:39:49 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 19 Oct 2023 20:39:49 +0000 (GMT)
Message-ID: <756bd224-b5a7-f91e-d299-a6d15517f37f@linux.ibm.com>
Date: Thu, 19 Oct 2023 16:39:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 12/13] migration: Use vmstate_register_any() for eeprom93xx
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Corey Minyard <minyard@acm.org>,
 Leonardo Bras <leobras@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Halil Pasic
 <pasic@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20231019190831.20363-1-quintela@redhat.com>
 <20231019190831.20363-13-quintela@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20231019190831.20363-13-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Di0N5Y1vilJJunDUGTu7JSjKGMlWIgXX
X-Proofpoint-GUID: OUNep70zv46FmAvN9BKiAPYHRryK5-wi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_20,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 mlxlogscore=874 lowpriorityscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190176
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: sRUJy29rvB0T


On 10/19/23 15:08, Juan Quintela wrote:
> We can have more than one eeprom93xx.
> For instance:
>
> e100_nic_realize() -> eeprom93xx_new()
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>   hw/nvram/eeprom93xx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/nvram/eeprom93xx.c b/hw/nvram/eeprom93xx.c
> index 1081e2cc0d..57d63638d7 100644
> --- a/hw/nvram/eeprom93xx.c
> +++ b/hw/nvram/eeprom93xx.c
> @@ -321,7 +321,7 @@ eeprom_t *eeprom93xx_new(DeviceState *dev, uint16_t nwords)
>       /* Output DO is tristate, read results in 1. */
>       eeprom->eedo = 1;
>       logout("eeprom = 0x%p, nwords = %u\n", eeprom, nwords);
> -    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_eeprom, eeprom);
> +    vmstate_register_any(VMSTATE_IF(dev), &vmstate_eeprom, eeprom);
>       return eeprom;
>   }
>
