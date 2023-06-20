Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp397117ejt;
        Tue, 20 Jun 2023 10:25:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5fD5Ss3HXjSvYhbtT5u2sp4Fil0Nm9Yh++/K5iG1BbjAnbGq2mLW099tug8aYODjGEVMKS
X-Received: by 2002:a05:620a:2955:b0:763:a83c:a9e4 with SMTP id n21-20020a05620a295500b00763a83ca9e4mr5203736qkp.31.1687281909478;
        Tue, 20 Jun 2023 10:25:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687281909; cv=none;
        d=google.com; s=arc-20160816;
        b=CLgFBG8i8l6TmOyMbdBQiIQjIVYHMyQ8u1rk+sSBGYntXeHExW6ag2GOfQQ4PbUDwO
         i9Svp09tgEsWHV7zmatemQgiEUripyPet7Qb/4uz7dhvg/AYRWOir+AHxqFfmSkmEPT8
         PjeLSF295PC2Lv8RKO1r7geAjlWtrXaf1W0G/RGNhoS+W1tqMqSIm4fAuMU7ju4Uc6tZ
         brbTO38HcZvrmi4YyaHxPff9QsDHn6k/uaJg2ovLG4hlFahuhLB+CBk0GzfQ+5fhhL0J
         Ith1osz0LwvR5BJWa5ihlpGgF8nbwcidw0GFVECmFG2AU+BLoWEGNu4hkKbamJ/UyAxj
         5ttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=OURr6F2KjHuxCILclp1JKQeKylPthvogQZg26aOlsQw=;
        b=KWa0wAF76E22R+gw3jcSz7+T1mjpDi6J7v/c3WIv3n+MB5jAOBU82epIujGRYLkq10
         QzbBLllE62RV+GDT4AKRXliKNoWW2WTBFH/bRStovm1fGCE/8sojK1To/O5Yld1cmZwS
         UBCXkcNiypvrNLmcTk488DF58oKepRrcKyw+LjUzEeliT455/ipOQ/Sd467HiK6HZZ/N
         ErygzgYkg2eORObK7GEQykLXmxfitD5xtJ/T50tn1hemNEyL+gZui7qwVd31xh09Osqp
         Iyn1b+y8/rZD9Cqx5l2pobtlS6OUx5g1m2alJpTMU+ODfCOqV9FolfA8uucjvoiPQ41E
         LRhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=Y0nkKO+x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pe2-20020a05620a850200b0075aca7bdd7bsi962952qkn.779.2023.06.20.10.25.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 10:25:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=Y0nkKO+x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBf68-0003hW-L2; Tue, 20 Jun 2023 13:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qBf66-0003gl-UA; Tue, 20 Jun 2023 13:24:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qBf65-0006Be-8w; Tue, 20 Jun 2023 13:24:54 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35KBq22s015870; Tue, 20 Jun 2023 17:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OURr6F2KjHuxCILclp1JKQeKylPthvogQZg26aOlsQw=;
 b=Y0nkKO+xU2eZeXsm62YcCXThFp2ciiFAjuguW+R8Q4E8afJ09z9GWklXnx+IwSVtSFM4
 by105k9CGFQDkENaLHfThaJj4G51pW2Y6T/rNV4eOPvHbxq4LwTluxZX5JFGnUnLfWwY
 ci8PuN+2QKX/hPNCfi3fbXYFpatGBzo4TpCbOjBnPgr1UBvBzBkxc4VBNR/PF/0Iv/Yb
 DjJWesp/v9/T6o34MHgYFEFBGEL3BzrxTr+MICP8siv3a5o1qfqAnZu/Fx2rE4u5CsLi
 drJRSNHrhjzP9VwI1GGv3hlZ1b2AaHC0CxrrmrNMb6KQFpICvOFBxouCHfJyL1pr0AX1 2Q== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rb6nmspux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jun 2023 17:24:48 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35KHOlq1019118
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jun 2023 17:24:47 GMT
Received: from [10.111.133.218] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 20 Jun
 2023 10:24:45 -0700
Message-ID: <f1e8edcc-14ed-0e97-0172-292032e61f1d@quicinc.com>
Date: Tue, 20 Jun 2023 18:24:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
To: Peter Maydell <peter.maydell@linaro.org>, Yuquan Wang
 <wangyuquan1236@phytium.com.cn>
CC: <rad@semihalf.com>, <pbonzini@redhat.com>, <marcin.juszkiewicz@linaro.org>,
 <chenbaozi@phytium.com.cn>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230607023314.192439-1-wangyuquan1236@phytium.com.cn>
 <20230607023314.192439-2-wangyuquan1236@phytium.com.cn>
 <CAFEAcA-B6Pbc2KyTVP9hheGfEecfTbwu-zi7_9EmjJH5opbiYg@mail.gmail.com>
From: Leif Lindholm <quic_llindhol@quicinc.com>
In-Reply-To: <CAFEAcA-B6Pbc2KyTVP9hheGfEecfTbwu-zi7_9EmjJH5opbiYg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bV2zoUw6hwXtrSVKZjmQJyabrsA6wVDx
X-Proofpoint-ORIG-GUID: bV2zoUw6hwXtrSVKZjmQJyabrsA6wVDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_12,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 mlxlogscore=610 spamscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306200156
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kYjZrJ37SY3T

Hi Peter,

On 2023-06-19 13:47, Peter Maydell wrote:
> On Wed, 7 Jun 2023 at 03:34, Yuquan Wang <wangyuquan1236@phytium.com.cn> wrote:
>>
>> The current sbsa-ref cannot use EHCI controller which is only
>> able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
>> Hence, this uses system bus XHCI to provide a usb controller with
>> 64-bit DMA capablity instead of EHCI.
> 
> "capability"
> 
>> Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
> 
> The change itself looks good. We could probably mention in
> the commit message that existing firmware/kernel images
> still work (with no USB support) with this change.
> 
> Is this the sort of change that we should increase the
> machine-version-minor for ? The comment says "updated
> when features are added that don't break fw compatibility"
> and this sounds like one of those.
> 
> Leif, do you think we should bump the minor version here?

I think that makes sense, yes.

/
     Leif


