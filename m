Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3783342ejc;
        Tue, 17 Oct 2023 02:22:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGopxtx2hxoCrNYVJXSOANLiplofSiScRsxnbZP9hRKFXKvzIuB5hCBjdBSKb+lqJztxjTX
X-Received: by 2002:a25:f56:0:b0:d9b:4f28:4f7a with SMTP id 83-20020a250f56000000b00d9b4f284f7amr1533922ybp.55.1697534523218;
        Tue, 17 Oct 2023 02:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697534523; cv=none;
        d=google.com; s=arc-20160816;
        b=IxU+/L67ytTsHdkup1ZLncaMCALoiwcXoloLIzLYypjicv2DPIMQMx3D4PzuyQ1eFS
         Wv1s/Rs+rvBpw64JDyAy2J9N+VxLpUScEtGW0X1mI+CqmU8OCxR4Ih8GRtht3ykLPP4q
         eTZajgk84vuGtQDDeFtNdxMCud1u93CgiBZ3ebIrXsn+y7H8GgUa6ASFxD6wFNxf8lc9
         if3QrkzeWxLbDo4ytHBNayGuscKGzmFUQje3vTrhtRJ+UPTAD8TygcdhFSl0bK2O9Zif
         fqYB0mgmOHVM+HEk4NWX6Hy+n49KDpZn8nzvtO1sBQ9EzuzTcDHeCtrviPZBa9Us0Wfb
         DeSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=1qeGk3zhOotevqJQGHJ9RRK/VZ2RvlFuBdV8SDV82vQ=;
        fh=fmwShfj/oMnMXJVmmkYihRxMUmUntuSBtOPL1loPlXY=;
        b=XOZ9NFibOiCytJHVYptKAqCS5LT13AP/DX8TJlVemRXaGwk2LfhySspq6vVTtnGGuF
         YuMIa3gGOg50SvH8giXx2AO2fLMlQ1rA0lySNB9/eePaZR150SqVBnm2UEVUKXwUMuPj
         YXDo/lxERD/QOL6IP+tffcAQpHgbvadVHQ0obTcypxpZRP+7UB8WF2MKHyLpOEWVv7bc
         fC2g2lb6B4EiznOsMxeZJaFzIKezt/oP74IYyMPKc0LNteu+xn8oEIvV1fvv4TplDq6j
         neMyQ9YyKl3HJ8iLcvagwgjGewzdQuvuiO2UX1CdGOu7TWcgYtB3sf5xaBbEFnx+pjPK
         axlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="P/tZAmra";
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id f186-20020a251fc3000000b00d9ac450d5fdsi497214ybf.724.2023.10.17.02.22.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Oct 2023 02:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="P/tZAmra";
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39H9FfxN011546;
	Tue, 17 Oct 2023 09:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : reply-to : references : mime-version :
 content-type : in-reply-to; s=qcppdkim1;
 bh=1qeGk3zhOotevqJQGHJ9RRK/VZ2RvlFuBdV8SDV82vQ=;
 b=P/tZAmraBZnlOxmOAwLMD0aYomCiuHVY18xgpRWpaI/yQ4pP7V9vTEi1oCZSbIHgJSCj
 YkMXOKNiohubfDSGTljHokY0Uo7pctzv3y5nksFg375ljZU1He2eLJJx+3jI+qRngwih
 66tMirlSUjX/MPeujnZSzaCeoL5gp/UCSMFsf0KaM0FnuezLHwPet8ocnBj+u6Q4Ua5m
 Gc8EtcwuFGr8JIP3oTbzyT9nvdtXrt55NhtHaHXgu9CjC59cn7tbTJOBXzMIDgOIgGf5
 vR7MZ3/zu1wR7aIGMJ7ySqqgUFdngQyPuN6rq/9ooSiRSw9PP58OerkOwr11kX21M4NH 4w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ts85ft5m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 09:22:02 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39H9M1bS006999
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 09:22:01 GMT
Received: from quicinc.com (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 17 Oct
 2023 02:21:56 -0700
Date: Tue, 17 Oct 2023 14:51:52 +0530
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: Alex Benn?e <alex.bennee@linaro.org>
CC: Philippe Mathieu-Daud? <philmd@linaro.org>, <peter.maydell@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <quic_tsoni@quicinc.com>, <quic_pheragu@quicinc.com>,
        <quic_eberman@quicinc.com>, <quic_yvasi@quicinc.com>,
        <quic_cvanscha@quicinc.com>, <quic_mnalajal@quicinc.com>,
        Brian Cain <bcain@quicinc.com>,
        Mark Burton
	<mburton@qti.qualcomm.com>
Subject: Re: [RFC/PATCH v0 12/12] gunyah: Documentation
Message-ID: <20231017092152.GA689217@quicinc.com>
Reply-To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-13-quic_svaddagi@quicinc.com>
 <31ae6951-2f32-ab86-4ddc-aa70364a89ce@linaro.org>
 <20231012123338.GF1130358@quicinc.com>
 <87ttqvnazo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <87ttqvnazo.fsf@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r49WL8qdl2RfA9U_0HwWVH1AxBB9rjzK
X-Proofpoint-GUID: r49WL8qdl2RfA9U_0HwWVH1AxBB9rjzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_13,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 mlxlogscore=518
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310170077
X-TUID: cE8Jk+yGgSnD

* Alex Benn?e <alex.bennee@linaro.org> [2023-10-12 15:55:59]:

> > Hi Phil,
> > 	We do want to see Gunyah support merged in Qemu at the earliest (as soon
> > as the kernel driver is merged upstream that is), so any dependent change in
> > Qemu for Gunyah would be of much interest to us! I am not sure though if Quic
> > can sign up for the entire "make cpustate accel agnostic" work. Can you point
> > to your ongoing work that I could take a look at? Would that address virtio-pci
> > becoming accelerator agnostic?
> 
> Why wouldn't virtio-pci be accelerator agnostic?

I checked usage of few KVM APIs in virtio-pci.c. I think most of them are to do
with use of MSI and IRQFD. If lets say we are not supporting MSI, then I *think*
current virtio-pci should work just fine. It would use virtio_pci_notify ->
pci_set_irq -> .. -> qemu_set_irq, which should land in
gunyah_arm_gicv3_set_irq [Patch 7/12] AFAICT. Let me try getting virtio-pci
working and then I can update this thread again!

- vatsa
