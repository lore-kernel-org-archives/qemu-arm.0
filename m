Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3364250ejc;
        Fri, 29 Sep 2023 09:13:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4Aum/mTuXANJxJlfsUeGHtTjv0XgmNCGvm2Dm0jZ/LvZ5EAGVitX9pzWUz7hseazJmR0n
X-Received: by 2002:a05:6358:9486:b0:13c:fd78:bb43 with SMTP id i6-20020a056358948600b0013cfd78bb43mr4461204rwb.27.1696003988135;
        Fri, 29 Sep 2023 09:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696003988; cv=none;
        d=google.com; s=arc-20160816;
        b=N1dJPBkCWKLMiYf5xil8zrVriF3VRHl9VWKl1sWpkUNiUWV0iZQSJVFfLeYN9DwJTS
         uI1g4v69QxHfo6sjfhrnybDcOl1Yjq6RTVtSN2xofaqHLlmxH1uRJ74H+YUvGLSigan/
         pKhDzkSpRcshD64/o70yiHMsWGRoZPSY6Inme2gGT2JRtf8AJCdWR6TlTI4dR8dXKogN
         9ENdtjkYJv2Oqty/lviMCryRDiZnIhKIeDnNwHl3EYoYRYC3SoWWrnapvBvaE0KVjRzq
         NAlPhL+mkaxjAsr+D/iWNFFR5qy0s3NzUW3nD9C2hgGr6eiSb38syLTSMY9vcI3RNQQb
         CB8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=pIq3FD7Dbr+IjX8CIVWaFGOYQHXu1/x9M3jr3G7SIHs=;
        fh=UvaE+rPFISgBASV7qklHyRiEf+UccuB2zVwCX8JG4EQ=;
        b=nEBU7adpqMyqkzVwGuLStFTHmJgkTcIKBYKtpMr5k9oqdcNQjLBN9o1Fz4yKcR2MfL
         /EbdKJY8cbgMldQTfqJyMJBXZF21jhLQm77HWR4QSf33NX8b4VI6c/DYmB7JQSnw2TAS
         mCHprAnEbopR1vwMikoXeGLbj31XJVyp2Wma8qodjG0O5++gnrN7K/Kxcsu0cQ4TdV4i
         M83MoLC9tCWJsIevyRP6T4ztTWs6fAzIUAD8iWgVFwFw/5ACQEyNzxE7Fovp5e4r7Skf
         2IKomgoROgTyadkRRGxs+u1tLtX+/aUZ1OhVohNogJbHLgllgH5wmyCCCI+P/gBX2dF4
         yRkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=HtvIfcB4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8-20020a0ce148000000b0065af5b26469si6867383qvl.386.2023.09.29.09.13.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Sep 2023 09:13:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=HtvIfcB4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qmG6a-0007FG-9t; Fri, 29 Sep 2023 12:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qmG6Y-0007Eu-UB; Fri, 29 Sep 2023 12:12:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qmG6W-0005Qm-80; Fri, 29 Sep 2023 12:12:37 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38TFeFmv025357; Fri, 29 Sep 2023 16:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=pIq3FD7Dbr+IjX8CIVWaFGOYQHXu1/x9M3jr3G7SIHs=;
 b=HtvIfcB4aAmI08bOmoy8grVLucJmmY31nliXQpR9AxgB70Be/tVtcGVBf2JNDojP8Mmy
 cHOej7fnAmZhdZ0IMK9rdifIRfYn71Yu0xtKkAxUqXVbyeBpauF5z1F+WTDjXjE2RE42
 Cve4TCM/WBog0ePiSQ+w9A6HtiMYYBjT4xJkuN1WXUo3OaL0x6LVTJAAKkJV8wRPLtL0
 UMPIopOGRtxKjqPxVvDzI7MWNGJ65s9JBYfq8B0/fdR9skV2dCuEPjX8f9oH0bL3cW2l
 uWSRV1PN+6kJ51Nfj9Pqe9L9w2qsc72AvLqlvOf8f2ef0IE/Uqz0S/Ww50K9gBgO6heb dQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tda4c30n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Sep 2023 16:12:31 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38TGCUYG017756
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Sep 2023 16:12:30 GMT
Received: from qc-i7.hemma.eciton.net (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 29 Sep 2023 09:12:28 -0700
Date: Fri, 29 Sep 2023 17:12:25 +0100
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: Thomas Huth <thuth@redhat.com>
CC: Radoslaw Biernacki <rad@semihalf.com>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] MAINTAINERS: Add some unowned files to the SBSA-REF
 section
Message-ID: <ZRb3aTLxBSnVGGr2@qc-i7.hemma.eciton.net>
References: <20230929141918.397096-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929141918.397096-1-thuth@redhat.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6OXX3-a83h1mQ2qJ9m6X6ePdxQhafEh4
X-Proofpoint-ORIG-GUID: 6OXX3-a83h1mQ2qJ9m6X6ePdxQhafEh4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_13,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=769 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309290139
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: L9TCe8YxwtLz

On Fri, Sep 29, 2023 at 16:19:18 +0200, Thomas Huth wrote:
> These files belong to the sbsa-ref machine and thus should
> be listed here.

First of all, thanks for this.

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 874234cb7b..fc415d3cea 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -954,6 +954,9 @@ R: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/sbsa-ref.c
> +F: hw/misc/sbsa_ec.c

Yes, pure oversight, sorry about that.

> +F: hw/watchdog/sbsa_gwdt.c
> +F: include/hw/watchdog/sbsa_gwdt.h

I just want to clarify that this is not "the watchdog for the SBSA
platform", but "the watchdog defined by Arm's SBSA specification"
(and belatedly the BSA specification)" - the specification that
sbsa-ref (intends to) provide a compliant platform implementation for.

Another such component is the "generic UART", but since that is a
subset of pl011 there is no real value in providing a dedicated model
of it.

Which I guess is a long-winded way of saying: this component does not
necessarily want/need the same maintainers as the sbsa-ref platform.
I'm still happy to maintain it, and it may make sense to keep it under
this header for now.
(In which case
Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
)

Regards,

Leif

>  F: docs/system/arm/sbsa.rst
>  F: tests/avocado/machine_aarch64_sbsaref.py
>  
> -- 
> 2.41.0
> 
