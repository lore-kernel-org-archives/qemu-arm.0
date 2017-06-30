Received: by 10.25.227.6 with SMTP id a6csp5638352lfh;
        Fri, 30 Jun 2017 06:45:04 -0700 (PDT)
X-Received: by 10.46.32.16 with SMTP id g16mr6079433ljg.125.1498830304387;
        Fri, 30 Jun 2017 06:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498830304; cv=none;
        d=google.com; s=arc-20160816;
        b=jQp4kMJ11D3+lX+wPut+M9N+MNUsOMKp29e+3s2/JWLG/3vzJctl7L+DSBld83abUY
         Sm0NnB+XSEbqDT52EV6GreTlE7KnaWRbfXtTXTto1IWJWmgc38SETfJC8y3Bb1OX5ivn
         PqRTgIyysIJ6HgceaGalrOG1yQg0GESsoQvOfVLErmNA+OY5tD8uXTRJQjhNfE5NP1OY
         +9O/4NXQWm19KGq2fk2upYyqfDg+QPC4gcpId8LS6odel238x8beaIXfoGTHghLxr+2B
         PSCqemjWNAa4tB951zQvDNy3K4tpbRHDQgQUAioW+o1mXYu6IjVjKo/NRGW0mPR9MQeA
         9vtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature
         :arc-authentication-results;
        bh=+HzpJ6ui6IJo1IZQyu48nD1GU93upMdGq5ymL2k/QR4=;
        b=N+1MTfYtwMQT0A6+hRFZJfDUtorwLxB6STwxup7Iqv9O2riuAk8B1VdkvdpKI08Ks2
         kipDaQBTHC+MSNNUBW2zCm2CuTjmHvoRIa2fe/OL1lSEjn/KHvOwzhC1mEmt9VoyQO83
         sXLpSkWTrsVmBMSy4MS0HlCRW1XcEJP3zfMfltjTXzYw6WU+TbZCg5DpgIbgExRP0lk8
         fkm/02CegRvrfvNve1s4FR5xQGujcSHS5Do5ApjJoVVcuNDJqWFfCHOmlTD9RajFoZB7
         GapgzBcTRyYl2Xh9U7egN9gXP2+DyaW3FHhdE0+oEypAo8vUEX5iY/PSiGJwGmZHcNK8
         LdaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=Xc5qLNO6;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:4010:c07::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com. [2a00:1450:4010:c07::244])
        by mx.google.com with ESMTPS id 64si3883124lfx.333.2017.06.30.06.45.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Jun 2017 06:45:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:4010:c07::244 as permitted sender) client-ip=2a00:1450:4010:c07::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=Xc5qLNO6;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:4010:c07::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x244.google.com with SMTP id g21so10121631lfk.1;
        Fri, 30 Jun 2017 06:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=+HzpJ6ui6IJo1IZQyu48nD1GU93upMdGq5ymL2k/QR4=;
        b=Xc5qLNO66xo9oRxVlE9GBoEePEqiviZM1crA1NMosoFvTeZM5AbdNnXZJIbMtRKyaF
         Vf7+BUJwFPyXfYqEYevj7XsncxTMDKYzoEuLM1pf+T9AfIiURc2BxsClgrTGWyp4uQno
         KZJTeBUTsEi1FhWaF0ckdh2PJbZglIQOvXd4Q+8PoJ2vmnl3I8kaZOeDK5GvNHZf8J6r
         A+di4uAa/mO75eNggC1t3aA0Uw4Lq/GFd+pfEisSaBz4bd6VBZXU9AgbzT/9Ejn4IM/m
         u6OhrfdhtwjMYpRcYbcR+M4Sm8gKpGxeL3uMDgw0Qi8uiNlzkVTBkco8iUMGs4homQET
         7q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+HzpJ6ui6IJo1IZQyu48nD1GU93upMdGq5ymL2k/QR4=;
        b=V/+Xh1/uUcz4Ze9+fhlxMfu4et4TFLuCgSLkHT7fNX/lRYEBsA4rsIce/pxl/Tw3xv
         W5kcsQSUQktX0XVGgTGXHpp+RWTjVY1WsPoNglaLprQjV2RuuTi+LvmesMxDxUjANkWf
         ZkDlUM4tYYslJtCskOrG8YnkfiyAQTeHAHr5MI/K+MVD7zRmwp5y5paEYCIlhYy/ZcbZ
         uu19Ht3hdKtPW89RrXxpd1dNWMminK0iKIBeCDy4Bow42w4EtnZ5C4K36RS8llKlmzyY
         C7EReB415Wxip1fJWiSbKGSa2daELNLP8LVWl+U6xS5ccAYDFShMfuYPiqpUQMAA1dgg
         HhRw==
X-Gm-Message-State: AKS2vOyAE+IlkdcB8lodfS9IPwWOKKtCQCbKnAqYCoO39SM9KoNOLCPR
	TX6TVgnHCr/PXVhD
X-Received: by 10.46.1.134 with SMTP id f6mr6505776lji.85.1498830304087;
        Fri, 30 Jun 2017 06:45:04 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id y4sm2049141lfc.8.2017.06.30.06.45.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Jun 2017 06:45:02 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 0/2] arm: Extend PAR format determination
Date: Fri, 30 Jun 2017 15:45:00 +0200
Message-Id: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
X-TUID: MlEmRPnqoxW9

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Hi,

These are a couple of patches that implement more details of the
32 vs 64bit PAR format determination for AT operations.
This is due to issues we ran into when running Xen.

Best regards,
Edgar

Edgar E. Iglesias (2):
  target-arm: Move the regime_xxx helpers
  target-arm: Extend PAR format determination

 target/arm/helper.c | 434 ++++++++++++++++++++++++++++------------------------
 1 file changed, 231 insertions(+), 203 deletions(-)

-- 
2.7.4
