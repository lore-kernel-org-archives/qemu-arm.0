Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9D6CA5FA5
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 15:00:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBZJc-0004ZI-IR; Tue, 29 Sep 2026 11:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBZJU-0004Vf-TV
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 11:00:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBZJT-00050v-57
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 11:00:12 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCqdCH1576994
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 15:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oC6ycxct5evGf7msqSYvksrjwR+3Ojl2H7PIOG3pGA4=; b=I3uoVswzPOAVm45U
 TySoSv+ewy4ebXsFI5kGIvjFmCG2aGKTapyARHykhPziLI1dvgeJCBMgbQJM637F
 YgCVPCaEM6MRsSMgoOzaAlkb4kcLRvAIDqpP8VnjmjZP5RYb//VVIaXwT5T2jKw0
 It0z1aq+EjF4HubqI0tWmdcikjGL6pjh4EEpZO3YEFLxIc6NSdwUVNBwaBiVM8kt
 zRHFLdSyOFa98HPyUmNzIL2Gf440igV6CKRnLbOjy5SyLdTScKTRnef5n7WP7nf7
 0ycKhQRwT7HvGPWkaAOdQFUGagb073o7Z6R3zyknWd/ukp99+YuBx6X0oriOUDeB
 1qNitQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4snfa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 15:00:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93bfb2da664so1215842785a.1
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790694008; x=1791298808; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oC6ycxct5evGf7msqSYvksrjwR+3Ojl2H7PIOG3pGA4=;
 b=UqBxgU2QaCs5nKvp37QgUxjFEeqTOXPitUi4x7nF40J0UjezKwxd0fj7H7+CRvZzkh
 yJhymoi5fshIxagd3D2Xi0tXXfpQymhiKTCUzEoAQ75/4wPh65zSJUqJs7Burt0NH6xX
 2D3s6CfgeYSfIAKQ3fr/T82s7Wm52BWkdwc7iDVsoApJ6N44+9/6ESCSwITnUbdzdsCM
 0QnheGC6vnJv5U7V1ZM9T0cPd2gOOwEe2UsIxB9J+WU1QbAODrJqmI747D0NymLwMQ9x
 bK9Gj88yQJY03XmYwMhvGMNd28S6QkRy/hUKOZfRJHv7CpI7wH0+YSOKBLHhIZ8iXI//
 apLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790694008; x=1791298808;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oC6ycxct5evGf7msqSYvksrjwR+3Ojl2H7PIOG3pGA4=;
 b=ov7eRzOgsdxV0X/Xegnu2SdBY6+tD33GeIggs6YiG6mYT2/GKqS/CB/EOW+N+Gs+Pp
 D4CjDBbDKRkPRSMcuwbII/BeQ5zOs3pvFwkUyrk8BbdNGFoe/m3P+p4EUAVOlIyMB1oN
 ng7Xauko37VR8k4T2CTmNA44Fhg/coDKC0NITmJ2HadcyL3C2h89cHBdYPHTT2gNhbCO
 4/d/wk37mjc3KynQ0R8nXZfaLM+pUDHhgiwlqDung8igUfdH4/M372EfdihwuAt3WPYX
 rApDNPt01lVdGBoy9espI31iKmIMIwiVlnfJ4u2HnWilXNFd3YDIz5yiSWdMfj0xv+Hy
 Rfmg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxEWwDtER/jY3GcJggZUFq569wsf6C5xWRKYDqPUoCF1AiDDPJBcmKdP7IGaSVxRwgNJyCGKPuoPg==@nongnu.org
X-Gm-Message-State: AFuF++mzvC4FtWwyK20giQUTc2b9UNQUnuPUkjjh5B60w+q+c4kwMEdG
 v2/cMOjr7SWOWGl2c5+ZlOa/lWths3KPZGlJjTNPOWnEsYC010TYO5XKbRp7N8/+TQDY7svixQb
 E6WPxQ0mALadPOX1Ve3BjeTwRnhVrHBEaWbScr8/aOxp2Xyin5EHDScI=
X-Gm-Gg: AYBFou17274U2Mwd20GirNKJ56CX0G5PvRGcW7VhzO+j7DqPbMZq+s3eQ3fNNXF45qh
 wIbG3yy7jrJ40oN3QSHHKh5vf8PRMSQLFnpd/sqvsVSqnRtzDrdyUqYROtD1qQ057czqMU38Mhj
 cD9AadY7zSkMJx0iYR849Y3Z7tyXaQk5mAhgpywi2F8BCgHnWAz/wvGGGU4p/brhqdYGdYoGLyK
 6V3HblBo0N16JibIhAhfU7OrYY5BnCSSmDCIxWuAcpAnAOmLgk8KqO74Izg0q0J/phc6TVbRzIC
 DQEW8vlq/OxiPuM04jRxLcEDvdTfgRLbXfcTFWMkJPCFnbLqGH+7fHeRKxH1woRfzDNvl2kmIZY
 knWkelyhPIiEyj8hjN/niGU+/JlmW6BKksg==
X-Received: by 2002:a05:620a:4547:b0:93b:bc51:b40 with SMTP id
 af79cd13be357-93c47223f95mr2617131885a.2.1790694007677; 
 Tue, 29 Sep 2026 08:00:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4547:b0:93b:bc51:b40 with SMTP id
 af79cd13be357-93c47223f95mr2617120885a.2.1790694006945; 
 Tue, 29 Sep 2026 08:00:06 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a014217216sm760635e9.14.2026.09.29.08.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 08:00:06 -0700 (PDT)
Message-ID: <1391eb6b-b4e9-417e-a634-115fc1751166@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 17:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 18/25] target/arm: add cpu-models-stub.c
Content-Language: en-US
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, eric.auger@redhat.com
Cc: cohuck@redhat.com, peter.maydell@linaro.org, richard.henderson@linaro.org, 
 maz@kernel.org, oliver.upton@linux.dev, berrange@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, gshan@redhat.com,
 skolothumtho@nvidia.com, sebott@redhat.com, armbru@redhat.com,
 philmd@linaro.org, yangjinqian1@huawei.com, shaju.abraham@nutanix.com,
 mark.caveayland@nutanix.com, ping@khushitshah.com,
 sandesh.patel@nutanix.com
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-19-khushit.shah@nutanix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921123249.1708067-19-khushit.shah@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1OSBTYWx0ZWRfX/F6Lax2xGkDi
 +671WktYMZM74W+o1eQYEqyBaUX4D3qwqqx2tMPWR1NyI2RjwSvrB/ueFUUl+zsJfGlqWHVWSW3
 5ZEQKkX9ubhUiZ/la+ISjY/av3MY2co=
X-Proofpoint-GUID: DTbKvjIX11NYiby0ud9fhEAKoWlXkLmb
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbd278 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=64Cc0HZtAAAA:8 a=kBidzhC-Fu57bEbtvHYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: DTbKvjIX11NYiby0ud9fhEAKoWlXkLmb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1OSBTYWx0ZWRfX2s911Gd6qkW5
 qv9i34g1vupn8w9P8TjRIrBxELz49I6b/4iaQkUMCkHznulSpbogneIOWp31BZ1CIEfHCPJPBbD
 g60huOJrhRqA39JHUFRdiAXJ5TmJjfSLC6cCPtGIiJ8b3Laj/y/9d+jyF45D4qSBx6gJcgcdekD
 veWW3E/QYxYrBdjM7pjwQGfSMUBbIPbhuODi3t5JbspLr+5ygPJ+I88MaMlxe+/xAbKnHcFE5j8
 MmQWcgmESmtzQC4qeaYhBSqT93AKuKQ6lSbp76cxDQ1oU/wPYCdntM9dc4OeJONPPtxrwxtAIwC
 DPwn3L0Paw1Meb4vj7FFZgvXXzPuqlsxuHvQISsO+O52evhZ6ayBXwOdr2Wima13eLhrUrdxpyF
 K90T7F9YKOQ6/qwJKYh27L70yWzS9VjDqm/ybjSy+yBAImJuG4J39Et92sHQ0m1Suokd3d3k9M+
 3HcXhvm85dXSWTyxe5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290059
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 21/9/26 14:32, Khushit Shah wrote:
> Add cpu-models-stub.c, which will be required to add QMP support.
> 
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>   target/arm/cpu-models-stub.c | 13 +++++++++++++
>   target/arm/meson.build       |  1 +
>   2 files changed, 14 insertions(+)
>   create mode 100644 target/arm/cpu-models-stub.c

Shouldn't be needed if guarded in qmp_query_cpu_model_expansion() as:

     bool named_model = false;

     if (kvm_enabled()) {
         named_model = arm_find_model(model->name) != NULL;
     }

