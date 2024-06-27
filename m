Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp147522njb;
        Thu, 27 Jun 2024 02:07:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLerJLLekTIYn6k24QTBseWDGQtXr3KDPYuFp0VW3e2WIsPoEORGqYS4WyyBpbXqxHjQ7W
X-Received: by 2002:a5b:28f:0:b0:e02:b4fe:e74e with SMTP id 3f1490d57ef6-e030109a7a1mr11921146276.51.1719479232774;
        Thu, 27 Jun 2024 02:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719479232; cv=none;
        d=google.com; s=arc-20160816;
        b=OS5maGQznYD03Gqvn+Uvv4vz84BuwrkPw8j4NLAajt1D1pVFxoPZcVRcM1sJiIl3+F
         BFdFBWG2mAlNFm1dQQrdCisegsbgu25GlxkIdx88wVrMkjCccTZDjQnfOOBg+1vewVvu
         pLkTShbN0uV2sy/Vwnu0jKyx1V1xwh4on4FQ1fMfYeZ/6EBfaVKjGJeDnWrFFF0dTVrO
         Xd/KbozTSsBtMy5xgIEHn9QsH5CqHMtiLAxlBx0WLTE9HVyjeZQPLNQXq9lNqRaDdB3n
         P2MZK1OjUhTF2qpildvhAE+/BwtT1/EXnpHlWpzZJr3ejCjBkusgqzWajSC8xVArY42c
         l29A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TVZWuc4liTdd37erFPVATZ2/L40os4LFO5X8bspIulI=;
        fh=1bA6OPw0XY+G7cjJscSYzSlPifbCChGxOIfW5OstXnU=;
        b=VK4yg6ntP9DPxwxGw4yor040xMIwNs5X07n2U4ffOxWGKS89bJnw7NcwIK/FDWZ5WJ
         dEHxUZRScrI5V/9HxpziBOx0CYCtBv6Iq0Bg4MY0zTFR0iQM21wIU/jpXbJ1QYHiL6Fi
         C0WJdmL/POdtHSsgOeIgitKAsJj1XkFYcD3ZPL4or1Vuth359kqmbJWDHmHgxFO5CSBE
         NWFMHUQY1r9lxgoXmX/vS4jvLpNrF8u9etDLnTri/1SOCdOfHco79TefC+5hQO3gmOH6
         3dy5IK9Niax+yOduubDT1mq2CLROE0hR9U16V2Rmw5UxXMMfsfyl9yl72tH04felOZ8f
         E+tA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="k35CYL/8";
       spf=pass (google.com: domain of quic_asalama@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_asalama@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_asalama@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e0345c5bc22si415221276.634.2024.06.27.02.07.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2024 02:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_asalama@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="k35CYL/8";
       spf=pass (google.com: domain of quic_asalama@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_asalama@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R0pKOR018978;
	Thu, 27 Jun 2024 09:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVZWuc4liTdd37erFPVATZ2/L40os4LFO5X8bspIulI=; b=k35CYL/8JOpU58it
	zIcej8VLMs8BdanS7qgppyny3k54FKAdvDVujnozpzO8OZN9fV71FeV4+1nIyyXz
	OpRmkMAIloysb36cN8x5mnp7HOsD0bMuGTfqW2CT+5Crp7DmJ0jd8DveSx+HdFPJ
	CQq9+WiESFmVgjJ8e4HYBsF8anFhhOFmvpiS0kVb+fkQPEeKsK0PAVjqcooH5VGk
	14R63/eZEVkAicJYQxF23mpLanhzGnhxJue/ChBIdniXm6i85zavK6ps5EwUV+ei
	SwMt/YpYvuNvXP+f5t9I652Tu8jqMdfLWtPk1Z7+ckw/A/fNEGXNfI9jB3MSSic/
	7SQBow==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400c46bkew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 09:06:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45R96nUe004654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 09:06:49 GMT
Received: from [10.251.40.202] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 02:06:43 -0700
Message-ID: <1ca0535b-e8f5-4624-8848-e79460bd60d6@quicinc.com>
Date: Thu, 27 Jun 2024 11:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] plugins: add migration blocker
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, <kvm@vger.kernel.org>,
        <qemu-ppc@nongnu.org>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        David Hildenbrand <david@redhat.com>,
        Pierrick Bouvier
	<pierrick.bouvier@linaro.org>,
        Mark Burton <mburton@qti.qualcomm.com>,
        "Daniel Henrique Barboza" <danielhb413@gmail.com>,
        <qemu-arm@nongnu.org>, "Laurent Vivier" <lvivier@redhat.com>,
        Alexander Graf <agraf@csgraf.de>,
        "Ilya Leoshkevich" <iii@linux.ibm.com>,
        Richard Henderson
	<richard.henderson@linaro.org>,
        Marco Liebel <mliebel@qti.qualcomm.com>,
        Halil Pasic <pasic@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
        <qemu-s390x@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
        Alexandre Iooss
	<erdnaxe@crans.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Roman Bolshakov
	<rbolshakov@ddn.com>,
        "Dr. David Alan Gilbert" <dave@treblig.org>,
        "Marcelo
 Tosatti" <mtosatti@redhat.com>,
        Mahmoud Mandour <ma.mandourr@gmail.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20240620152220.2192768-1-alex.bennee@linaro.org>
 <20240620152220.2192768-10-alex.bennee@linaro.org>
Content-Language: en-US
From: Alwalid Salama <quic_asalama@quicinc.com>
In-Reply-To: <20240620152220.2192768-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5BrjWSbPRhJF4lC33TjwbE2-KplVXvp0
X-Proofpoint-GUID: 5BrjWSbPRhJF4lC33TjwbE2-KplVXvp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_05,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406270069
X-TUID: yzO2Mjh2+dKG

Reviewed-by: Alwalid Salama <quic_asalama@qualcomm.com>

On 6/20/2024 5:22 PM, Alex Bennée wrote:
> If the plugin in controlling time there is some state that might be
> missing from the plugin tracking it. Migration is unlikely to work in
> this case so lets put a migration blocker in to let the user know if
> they try.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: "Dr. David Alan Gilbert" <dave@treblig.org>
> ---
>   plugins/api.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/plugins/api.c b/plugins/api.c
> index 4431a0ea7e..c4239153af 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -47,6 +47,8 @@
>   #include "disas/disas.h"
>   #include "plugin.h"
>   #ifndef CONFIG_USER_ONLY
> +#include "qapi/error.h"
> +#include "migration/blocker.h"
>   #include "exec/ram_addr.h"
>   #include "qemu/plugin-memory.h"
>   #include "hw/boards.h"
> @@ -589,11 +591,17 @@ uint64_t qemu_plugin_u64_sum(qemu_plugin_u64 entry)
>    * Time control
>    */
>   static bool has_control;
> +Error *migration_blocker;
>   
>   const void *qemu_plugin_request_time_control(void)
>   {
>       if (!has_control) {
>           has_control = true;
> +#ifdef CONFIG_SOFTMMU
> +        error_setg(&migration_blocker,
> +                   "TCG plugin time control does not support migration");
> +        migrate_add_blocker(&migration_blocker, NULL);
> +#endif
>           return &has_control;
>       }
>       return NULL;
