Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp767073ejc;
        Thu, 12 Oct 2023 05:24:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoSM1OOSVrxS7X+wZ8D9zYFhOzPeuSFO/zi1fRGgD+w3Xu8m8yMbXW2W1hB2Wz2074/aIM
X-Received: by 2002:a25:1688:0:b0:d11:61da:3a58 with SMTP id 130-20020a251688000000b00d1161da3a58mr20329549ybw.54.1697113495732;
        Thu, 12 Oct 2023 05:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697113495; cv=none;
        d=google.com; s=arc-20160816;
        b=NEdiKmiwJfUXqm0eHzsouTj1N4Hq0y9frExt5oD07LQA8M+wnMJbmhY7P9qBUejp8t
         +UYjtmKffzfwvnVgAKrYnpSnt25TFKMbS0n/3z2O3paQ5JbdzUu4oJNvqvauTY0jXCpQ
         Iaqp4Alm8Vrq0mGXe/g3fEoeQ21GJCFunBq4XTllXIDsbaGIUPaStQB4tNkAZT4mKeA9
         vuNKFr0su55f/XeusZO5cZ1394CgRHsquaUceJn7PepvUJ1/NowYYAv5Mloa7BaKJgpF
         f1T2doSkY682D0hg4Kb+wCdj1o8EQwOCYLLhRIOn1VGQTXYZeBJq8nijspVbRjxNMPVD
         TJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=2YSDhxDLPptZzA3deM35ZWSJCCo2p8N4v8iQSOsPL+E=;
        fh=MS49kWoz+LV5ricufXoft4D5wPK5OdH2HYbAkVP1Yio=;
        b=W3LLUsb1q4Y4ILI8EfmoQfvtPdSoblkSRvnh6+Aifh7k0L39BsGA+yOeKmb2ECl4mg
         jXxINhInz4KPjiqEWj8wNg2a91Pt5jURCxTgUNx6WjqfY4AhrnX1O2ynxm5sz1yf8DnP
         6yIN7jtMnngi/3/oCd5SpLEnh2RJX7/dr4NIX0Jh6bm9wk6EDmQL1wBoEgTtbkQpUc4C
         vy7iRfOFtVqI4rK2uaPvWp3Oyoy6TWf0wI29sUOcAtbTTci6Dh+34AreKUrbCBWf8XzG
         9Z+YDI494Rb4brmWrdFnPeSFDJpyVrKOusyn9qVgHdhgAlbRpeTa7ZP6S86iStajcCO0
         sxXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="obHqk/gm";
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id 192-20020a250cc9000000b00d84e7a94348si5544436ybm.596.2023.10.12.05.24.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="obHqk/gm";
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39CB11Ms028439;
	Thu, 12 Oct 2023 12:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : reply-to : references : mime-version :
 content-type : in-reply-to; s=qcppdkim1;
 bh=2YSDhxDLPptZzA3deM35ZWSJCCo2p8N4v8iQSOsPL+E=;
 b=obHqk/gmzQkXSzP4vra/MzPrZ+oPgZO/AxBGNWmGmSpO2xXA419AT9QTulzBP0VO1CJE
 Jvwv2ngOel4ugM96c932D4YxSsTiqgEF4qqEP6aJLK805Gc1ipMJXpq4Hom6Hey8sVIr
 MTYroz5rf5mHGOwrkmUEkatC1cHEEYn6L/UnVfh88rubO+rXW7sLA6cwEgxTwG9sdEFB
 YkQPcb88aQiEfuIJZeNK8F1roj/aelGpo5hshn7ZYn4KkR32SgbnPWdaTibz0rZbBql/
 N/L9pHgqiugRNr2VK3pbzf8zxUfQ6lD04wublv686UgMi+XixErxxRSh7JAwSekeTjFP sg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tp0vw9ytd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 12:24:55 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39CCOrst029620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 12:24:53 GMT
Received: from quicinc.com (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 12 Oct
 2023 05:24:49 -0700
Date: Thu, 12 Oct 2023 17:54:45 +0530
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: Alex Benn?e <alex.bennee@linaro.org>
CC: Philippe Mathieu-Daud? <philmd@linaro.org>, <peter.maydell@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <quic_tsoni@quicinc.com>, <quic_pheragu@quicinc.com>,
        <quic_eberman@quicinc.com>, <quic_yvasi@quicinc.com>,
        <quic_cvanscha@quicinc.com>, <quic_mnalajal@quicinc.com>
Subject: Re: [RFC/PATCH v0 03/12] gunyah: Basic support
Message-ID: <20231012122445.GD1130358@quicinc.com>
Reply-To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-4-quic_svaddagi@quicinc.com>
 <d4814468-3b1c-ea34-563e-9418bf1d6220@linaro.org>
 <87y1g8m5pd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <87y1g8m5pd.fsf@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1G0P8Bky1I-kHgNCm9eil4Lz8BPwkrfb
X-Proofpoint-ORIG-GUID: 1G0P8Bky1I-kHgNCm9eil4Lz8BPwkrfb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxlogscore=502
 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310120101
X-TUID: TxsmRh521UrR

* Alex Benn?e <alex.bennee@linaro.org> [2023-10-12 12:32:34]:

> >>   create mode 100644 include/sysemu/gunyah_int.h
> >
> > Can we move gunyah_int.h to accel/gunyah/?
> 
> If it's all internal to gunyah itself you could rename it to internal.h
> (although we do have various forms of foo-internal.h across the code
> base).

Sure!

- vatsa
