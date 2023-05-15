Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6406936ejq;
        Mon, 15 May 2023 03:28:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+o+fpP1z1vwqkUVa/xVGZ/uiy0MhT4hVxxIUHGkEZTqKto9l1hxR1CmUFk259lTcPd8W7
X-Received: by 2002:ac8:7fc2:0:b0:3f4:e9bc:226 with SMTP id b2-20020ac87fc2000000b003f4e9bc0226mr24425757qtk.64.1684146493630;
        Mon, 15 May 2023 03:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684146493; cv=none;
        d=google.com; s=arc-20160816;
        b=ymZgjJPqrkSNnZX6G4S4udOrtD6u0miEY+LeTdmzSVVdCQTEaVO3lVqR9KL3VNqsbo
         dZD3WiJ++pkwm5yREf0XseDayqLet4v6XaeMGiv9nEW9WMRO36e8tf+JUiJQFliFvbBJ
         hUuFp20rJ69QrDy9+69IihUpnDAN8/Bk5ASEYwv/HZKVfkId92pFkP29upXpQesIKp3R
         VHNJSN4gAsR+n51hCUmmRVxTmRGhrvbeRyVnO2vAOcWbwH1f6aTVGCXsFokGhzWZTt8t
         E/iBwyRs874OHIiQ5eoKGJzV7A0tEbdMq5SLZmc+WBEMDqB7o4WVhuh/p7CRKkj8cqkE
         QH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=/XGrPybuYdxlQPathNDYMH1dryw/BG9DhywDoxHoNM4=;
        b=guv3z/3YV5M9MVXP+soJt7FORAarQ5tT4dR1sfZqe0SvabDtuCAsMuY3G91b/77M3f
         C7wMTHZApVKMRrRcityDT0d7eop0dLeIomDC/a9dAIq0imwOyIVBsbD7o6M7Y0GDNzcT
         az25R87/6Fv0ZBk9T6i3bQrMSYzrxr6+VzcsDf+k7zXPLN3mSr3FMCLrKJF366kWAz3C
         Gzs72b6lsGMuvEsT5kodkBP2BewSdS4MLiEtqRJtF9LR3UapHTzoT6AgPngYb3NEaAbU
         fMRwv2ZJ2pNyLmKH/DjPmUeW3L4tRcYLN0fICPWJWgBvv/Vs6JH77Lfnp8fKZr5eLDmf
         P/1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=PdXNCao2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u34-20020a05622a19a200b003e4dfa86e21si9223864qtc.40.2023.05.15.03.28.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 03:28:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=PdXNCao2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVQp-000545-Vp; Mon, 15 May 2023 06:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1pyVQm-00053o-TP; Mon, 15 May 2023 06:27:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1pyVQl-0006aj-3P; Mon, 15 May 2023 06:27:52 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FAKmGu030103; Mon, 15 May 2023 10:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/XGrPybuYdxlQPathNDYMH1dryw/BG9DhywDoxHoNM4=;
 b=PdXNCao2O34AghvskPu7aGGlfRFS0zqiQjBUDvZ/tni1X6jUxVp5FDLq7lMLW7oXVOqF
 FI/PbNZs0kER3kaSu8ga3S66KjffmtX5CtGQ2JOU4WWEJKk7BNel6njoKaAgNWFtPYXg
 ffA4P9+6f8cgKBte7hi/UCITMbfkFSHo2PiyPqQ4kq4kzKVqHutzXEyPw6lPZfhlPmfy
 XMFM99nNvYph/42ManUxQmjy/R60F/C/dcDXc0lnzF5BRCSGiGPQayVrNZEoYcMM8b1Z
 UnE1UXIpIOJH+TSuItxXXRUJgFmrnqrL6J6HVUvRaDFxdBHtFG26XwV5hM+eJ2bnnILq 7Q== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkjwdr0df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 10:27:46 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34FARjkM024719
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 10:27:45 GMT
Received: from [10.251.41.85] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 15 May
 2023 03:27:44 -0700
Message-ID: <55d7cfbd-7256-2780-59e2-11e532e08cfe@quicinc.com>
Date: Mon, 15 May 2023 11:27:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] hw/arm/sbsa-ref: add GIC node into DT
To: Peter Maydell <peter.maydell@linaro.org>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20230515100438.359690-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA_beOoOH2GHQuaCyBU10yhkJ44FSrdVsHi7wTSz9QQxmA@mail.gmail.com>
From: Leif Lindholm <quic_llindhol@quicinc.com>
In-Reply-To: <CAFEAcA_beOoOH2GHQuaCyBU10yhkJ44FSrdVsHi7wTSz9QQxmA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: VK7QfxJ3BupCpqVAbUqEFOZbdnxUbI_V
X-Proofpoint-GUID: VK7QfxJ3BupCpqVAbUqEFOZbdnxUbI_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_06,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 mlxlogscore=604 bulkscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150090
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Xw8uAd0SKZO7

On 2023-05-15 11:15, Peter Maydell wrote:
> On Mon, 15 May 2023 at 11:04, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>>
>> Let add GIC information into DeviceTree as part of SBSA-REF versioning.
>>
>> Trusted Firmware will read it and provide to next firmware level.
>>
>> Bumps platform version to 0.1 one so we can check is node is present.
> 
> (Missing signed-off-by.)
> 
> I thought the idea with the sbsa-ref dtb was that it was
> really just a minimal provision of data to the firmware,
> not a real DTB, and that (as on real hardware) creating
> the DTB to pass to the next level of the guest code was
> the job of the guest firmware.
> 
> Why do we need to provide a full GIC DTB node ?

This was actually something we were discussing in private, but felt 
useful bringing public (for future reference if nothing else).
I believe this is a near-verbatim copy from the virt machine to kick 
that off :)

Longer-term, I want to be able to present different specific gic 
implementations through this interface.
I believe the 0.1 variant needs only the Distributor and Redistributors 
base addresses.

/
     Leif

