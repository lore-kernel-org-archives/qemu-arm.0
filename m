Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1169217ejb;
        Fri, 15 Sep 2023 04:56:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPOEjbFavErClwkih8hRuKpAJ49MxCAGPdcYeZcCvsPdZFRC/eNsiQZnwK5Ri9GGWRmlHt
X-Received: by 2002:a25:e043:0:b0:d7a:ee98:4f8 with SMTP id x64-20020a25e043000000b00d7aee9804f8mr1368828ybg.30.1694778967199;
        Fri, 15 Sep 2023 04:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694778967; cv=none;
        d=google.com; s=arc-20160816;
        b=hxT/3xTbyjoTvvc9ZYFJBEBfNVsYn44QE49oxcMs+1R7xsoqTVCrQocdjQ2shitu/A
         3jHnTG7nNrmR7mU8yXADVmzR7awXRMdFn9lk3B8tv0PmcNtJ+nLWTYUrhY3j3ZGg+lwa
         GDZVCAgCtJevszLuLPk8wKWmRDhoPmDqhq+kiJQVqzqjLJnfepoAyc6RGw9lpFOIYINi
         BktBcgzksloDMDgoKuQR6SRSCUP4/7H1LjUyKYQdhD+2DxT+/MQZOF2PK0b++kpONLTz
         XAGZ/ig8Lm2ynlgmaS9s+R+ANqHRhfQJLcCgXq/9XmsGTeHynrjF94BFSh9TkVL4MdoO
         30jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=RbS5OYdExWW+p9Jrsv76yT+mGj6brKlKGqq1fOZcQnI=;
        fh=y6h9FO02gZLWMvewekIZjGRdPpmsBRA1OJYAmgqeKaU=;
        b=IlEfwsr4eFwzQB7R03i9A/W9EdeAfca5akQ2TfOCFuEHeTOR8OKxtpFUanXIGELDxa
         Dmn82n2rpxYr7nfBGSOkflK1q/AG8vELHryH+nUoLMdvUSJp0YX32vvHaP/lDm1QDPiG
         xXgkMMv4LL/5MXPFpeRXOtdr9772WZQvtL0u0BiPW+GMbvAvqJLeIM0Ox0dldUAMKLam
         +Q103ctEk+oaGxWVbu6hB6zUMFzQvb0FznW31LalnYxMUUMZ7dfoQhIkB49saFtbo7jR
         7fvY/tTvrSdyXb1jNqDaVr8uP/nZeEaJLRZMHyB+LRzMluTXrajvOe9hOo3wwKaqWTrD
         iKQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=hZx5HHe1;
       spf=pass (google.com: domain of quic_llindhol@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_llindhol@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_llindhol@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id j185-20020a2555c2000000b00d81412c5b42si2255933ybb.586.2023.09.15.04.56.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Sep 2023 04:56:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_llindhol@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=hZx5HHe1;
       spf=pass (google.com: domain of quic_llindhol@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_llindhol@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38FBSWHm032736;
	Fri, 15 Sep 2023 11:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=RbS5OYdExWW+p9Jrsv76yT+mGj6brKlKGqq1fOZcQnI=;
 b=hZx5HHe1FffsDHdHkupfb4Wcuyizam2Rs9yFx/mrgb3rjr71rGR5Whx7pKlE3JC0aNSV
 bYp5PAtawJr14HAIHJQDWJLjzCjt/wM3L5WkPRt1iztm+SJA66450jGJEnldwVBkQzH4
 O2N7WjV7WrDreir3R1T0ULzLeFWAcFwlHf7ov85wvSr8B1H/mxdneFD96G4Dvhi+dBqz
 ASMhmWK2r83tXP8KcS0AKH0elrMpPuM3as7HH1FFgvVzgMLoxEhaC+SQQ9N0j5umpzVZ
 9EHjXzstgptY5kQFzwwEvjFXeOAWhs/oDUUUZcUi4l9VkX7V+RAH8cqsw3R82vv4NawF +Q== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g86rv0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 11:56:06 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FBu4AX010835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 11:56:04 GMT
Received: from qc-i7.hemma.eciton.net (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 15 Sep 2023 04:56:01 -0700
Date: Fri, 15 Sep 2023 12:55:58 +0100
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        Beraldo Leal
	<bleal@redhat.com>,
        Wainer dos Santos Moschetta <wainersm@redhat.com>,
        Peter
 Maydell <peter.maydell@linaro.org>,
        Radoslaw Biernacki <rad@semihalf.com>,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
        Cleber Rosa
	<crosa@redhat.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/1] tests/avocado: update firmware to enable
 sbsa-ref/neoverse-v1
Message-ID: <ZQRGTpNTFBeedYXQ@qc-i7.hemma.eciton.net>
References: <20230915113519.269290-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915113519.269290-1-marcin.juszkiewicz@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xS5KA8EqG1MXZYuDN1oeTwOIFFCaAjhZ
X-Proofpoint-ORIG-GUID: xS5KA8EqG1MXZYuDN1oeTwOIFFCaAjhZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_08,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=410
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150106
X-TUID: O9Zv2dOH5Tp4

On Fri, Sep 15, 2023 at 13:35:19 +0200, Marcin Juszkiewicz wrote:
> Update prebuilt firmware images to have TF-A with Neoverse V1 support enabled.
> This allowed us to enable test for this cpu in sbsa-ref machine.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Acked-by: Leif Lindholm <quic_llindhol@quicinc.com>


> ---
>  tests/avocado/machine_aarch64_sbsaref.py | 25 ++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
> index a794245e7e..b39f5566d7 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -28,33 +28,32 @@ def fetch_firmware(self):
>          """
>          Flash volumes generated using:
>  
> -        - Fedora GNU Toolchain version 13.1.1 20230511 (Red Hat 13.1.1-2)
> +        - Fedora GNU Toolchain version 13.2.1 20230728 (Red Hat 13.2.1-1)
>  
>          - Trusted Firmware-A
> -          https://github.com/ARM-software/arm-trusted-firmware/tree/c0d8ee38
> +          https://github.com/ARM-software/arm-trusted-firmware/tree/cc933e1d
>  
>          - Tianocore EDK II
> -          https://github.com/tianocore/edk2/tree/0f9283429dd4
> -          https://github.com/tianocore/edk2-non-osi/tree/f0bb00937ad6
> -          https://github.com/tianocore/edk2-platforms/tree/7880b92e2a04
> +          https://github.com/tianocore/edk2/tree/29cce3356aec
> +          https://github.com/tianocore/edk2-platforms/tree/fc22c0e69709
>          """
>  
>          # Secure BootRom (TF-A code)
>          fs0_xz_url = (
> -            "https://fileserver.linaro.org/s/HrYMCjP7MEccjRP/"
> +            "https://fileserver.linaro.org/s/g4C3WzJzNBES2p2/"
>              "download/SBSA_FLASH0.fd.xz"
>          )
> -        fs0_xz_hash = "447eff64a90b84ce47703c6ec41fbfc25befaaea"
> +        fs0_xz_hash = "374738599f7ba38c22924b2075ec5355c2b24a47"
>          tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
>          archive.extract(tar_xz_path, self.workdir)
>          fs0_path = os.path.join(self.workdir, "SBSA_FLASH0.fd")
>  
>          # Non-secure rom (UEFI and EFI variables)
>          fs1_xz_url = (
> -            "https://fileserver.linaro.org/s/t8foNnMPz74DZZy/"
> +            "https://fileserver.linaro.org/s/scJRninsAFTwEct/"
>              "download/SBSA_FLASH1.fd.xz"
>          )
> -        fs1_xz_hash = "13a9a262953787c7fc5a9155dfaa26e703631e02"
> +        fs1_xz_hash = "5d3f156ebd6c6374da2121e15c7c8f4ed0351dcc"
>          tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash)
>          archive.extract(tar_xz_path, self.workdir)
>          fs1_path = os.path.join(self.workdir, "SBSA_FLASH1.fd")
> @@ -144,10 +143,16 @@ def test_sbsaref_alpine_linux_cortex_a57(self):
>  
>      def test_sbsaref_alpine_linux_neoverse_n1(self):
>          """
> -        :avocado: tags=cpu:max
> +        :avocado: tags=cpu:neoverse-n1
>          """
>          self.boot_alpine_linux("neoverse-n1")
>  
> +    def test_sbsaref_alpine_linux_neoverse_v1(self):
> +        """
> +        :avocado: tags=cpu:neoverse-v1
> +        """
> +        self.boot_alpine_linux("neoverse-v1,pauth-impdef=on")
> +
>      def test_sbsaref_alpine_linux_max(self):
>          """
>          :avocado: tags=cpu:max
> -- 
> 2.41.0
> 
