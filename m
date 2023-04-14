Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp283386ejc;
        Fri, 14 Apr 2023 00:36:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350aV5KZgH0Pq4fhw0JIQrryM2UVHdfNpni82oeV1QrpJLVq3SA1ZSLqvAq5GdDxMNnLKZQ/M
X-Received: by 2002:a05:6214:5013:b0:5ef:435f:dc7e with SMTP id jo19-20020a056214501300b005ef435fdc7emr1764499qvb.52.1681457803224;
        Fri, 14 Apr 2023 00:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681457803; cv=none;
        d=google.com; s=arc-20160816;
        b=thQ6ZcGWI8rQAiaywRY4r/P20WJibN7zD+ufaEwiGOCptyB9Xx/LD6bV65o6Q6WnPB
         ybuPPbHYEwVB34qLwpaDyaEmNr9olxT3pZ8mEbzXvdGM42DttOd7yFTz28ZDCHn50aEH
         8IpcexxOb9le/gVzCrnJL3cv05/NCLA+f9iVxsB6QsxfHfjT3NBIpU37EXkYooABzxd+
         d6lIoyzmurFF/+NsBA8HE6XZfdiflv3pFgfCZeBNYEFbsC4AsPAez8Y9I4/1JmXFNtJR
         F8NS0kIXuWxh/sIqswJLiyPE/At1CFW/lGl8Pge/WjQSybU0qL0hLLmUS2mai+w5BE3q
         Q18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:ironport-hdrordr
         :ironport-data;
        bh=lvIyG0yssoOmLhQImC2xqZJ1iHtHryDyesDnStOmPng=;
        b=w0pNu2ncFkEKmHtbEzxC2NOAz1yhVg/Th4ai/kAa+5kUAEtIxALxtD8+7J5sgs4T5H
         kg21B0ON59Nh4+8+Hl/eZJVsVF6/4WQuQAu/el8f0s24HiE51o6mxI6IhMxAGwM/ORte
         0zpKAk9+ym3L7WXKYWrpEmy+vMGQRj4rpJ/rIEXnWphp23q8LxZI+24FsoccmsBLcBYI
         65HKL5XkBMA/L7vC1PoV4pTX+0iEIhuyg6N9BPl6rXtNrGJBaYiR7/uzeBhIPBc8ZxHG
         tFsZgU+igcm3yP0sTYQEwNoOOTUnWAwcB7MvPwnSq3sHIJpa2LXZeyp073AP5Cifhve0
         bCKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020a05620a244c00b0074a8df5e59bsi2477778qkn.670.2023.04.14.00.36.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Apr 2023 00:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnDyY-0007Gs-MJ; Fri, 14 Apr 2023 03:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slankes@eonerc.rwth-aachen.de>)
 id 1pnDyT-0007GU-4K; Fri, 14 Apr 2023 03:36:01 -0400
Received: from mail-out-2a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slankes@eonerc.rwth-aachen.de>)
 id 1pnDyD-0005pJ-8R; Fri, 14 Apr 2023 03:36:00 -0400
X-IPAS-Result: =?us-ascii?q?A2AHBACIATlk/5gagoZaHQEBAQEJARIBBQUBQIFPiU+xD?=
 =?us-ascii?q?Q8BAQEBAQEBAQEIAUQEAQGFAgIChT4nOBMBAgQBAQEBAwIDAQEBAQEBAwEBB?=
 =?us-ascii?q?gEBAQEBAQYEgR2FL0aGBicPAUY1AiYCXw6DA4JdrxCBMoEBhHKaaoFnCQGBC?=
 =?us-ascii?q?i2JIYJThgiBSUSBS4hEgw6CZwSaTQqBNHSBIA5KcoEEAgkCEUMogRAIaYF5Q?=
 =?us-ascii?q?AINYwsOb4FJgU6BXAQCFEcOEjcDCQMHBSwdQAMLGA0WOhMsNRQfXGwtEhIFA?=
 =?us-ascii?q?wsVKkcECDgGUBECCA8SDyxEDEI3MxMGXAEpCw4RA09CGWwEgQqBAQcmJJ4jI?=
 =?us-ascii?q?0+BDiSBVXCSdrEGgjKBVqBtGjODapMtkiuXdaNKhCwCBAIEBQIWgXqBfjMaC?=
 =?us-ascii?q?BwUgyNRFwIPog2BMAIHAQoBAQMJi0UBAQ?=
IronPort-Data: A9a23:gvt7UaBKLTxeTxVW/0Liw5YqxClBgxIJ4kV8jS/XYbTApGwj1DwHz
 WYbCG6OO/rbMDSne9F+PYTipkgD68OHy4VnOVdlrnsFo1CmCCbmLYnDch2gb3v6wunrFh8PA
 xA2M4GYRCwMZiaA4E3raNANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtcAbeORXkXc6
 Lsen+WFYAX+g2ItbjpNg06+gEoHUMra6WtwUmMWOKgjUG/2zxE9EJ8ZLKetGHr0KqE88jmSH
 rurIBmRpws1zj91Yj+Xuu+Tnn4iHtY+CTOzZk9+AMBOtDAf/HBogvZjXBYrQRw/Zz2hx7idw
 TjW3HC6YV9B0qbkwIzxX/TEes1zFfUuxVPJHZSwmZKq8nKceEXX+OtJHB5uNIsp5edYLG4bo
 JT0KBhVBvyCr/ip3LK2Wqx334EqatP0IINas30mwTyx4fQOGMufBfyRvZkCgnFp25om8fX2P
 qL1bRJ0aB3GYBBUEloQDp8kl6GymWX/NjRRo1KYo+w77gA/ySQtiui8a4eNK7RmQ+1pg22Hh
 03mwFikAxRGLv6UimSh0ViF07qncSTTHdh6+KeD3udnhUDWymENBRk+U1y9rv+kzEmkVLp3M
 0EI9zBoqKEj+EGvSvH5XhuxunnCuQQTM/JJHugnrQiXz4LS5ACWAHVCSSROAOHKr+csWiAq2
 0/MhIqsDHp1r6GVDHuRsLuZxd+vBRUowaY5TXdsZWM4DxPL+enfUjqnog5fLZOI
IronPort-HdrOrdr: A9a23:MaXPfK40zzXMV+UwJQPXwUyBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhIk3I6urwRZVoIEm1yXcR2+cs1NiZLW/bUQeTXeJfBM7Zskbd8k7Fh6VgPM
 VbAtFD4bTLZDMR7KbHCUuDYq4dKbG8geWVbIzlvhJQpHRRGsZdBnBCe2Km+yNNNWt77cNTLu
 val4x6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKWSSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8x/T9aw+cxjpAVr4RFYFqjwpF4d1HL2xa0O
 Ukli1QcPibLUmhPV1d7yGdmTUImwxel0MKgWXo/kcL5/aJAA7SQvAx+75xY1/X7VEts8p717
 8O12WFt4BPBReFhyjl4cPUPisa4HZcjEBS5dL7tUYvJrc2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcFkgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xCPefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzve4PcV
 T6ISFlXEIJCjHT4Je1rex2Gzj2MRWAYQg=
X-Talos-CUID: =?us-ascii?q?9a23=3AfsFrrmu6/+CH1JD8s75GL46m6It7S0DilnzuGHS?=
 =?us-ascii?q?mLnY2ELSTeECR145rxp8=3D?=
X-Talos-MUID: 9a23:b51D6gqJLEI0n7c7f9wezw1/H9hJzISRNB0MlMkcmcLHawhTER7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.99,195,1677538800"; d="scan'208";a="42893509"
Received: from rwthex-s1-a.rwth-ad.de ([134.130.26.152])
 by mail-in-2a.itc.rwth-aachen.de with ESMTP; 14 Apr 2023 09:35:28 +0200
Received: from Tartaros.fritz.box (2a0a:a540:ee49:0:4dac:dbd1:97f4:c51) by
 rwthex-s1-a.rwth-ad.de (2a00:8a60:1:e500::26:152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Apr 2023 09:35:27 +0200
From: Stefan Lankes <slankes@eonerc.rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, Stefan Lankes
 <slankes@eonerc.rwth-aachen.de>
Subject: [RFC 0/1] add support of `--initrd` for ELF-ARM kernels
Date: Fri, 14 Apr 2023 09:34:31 +0200
Message-ID: <20230414073432.36000-1-slankes@eonerc.rwth-aachen.de>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a0a:a540:ee49:0:4dac:dbd1:97f4:c51]
X-ClientProxiedBy: rwthex-w1-a.rwth-ad.de (2a00:8a60:1:e500::26:156) To
 rwthex-s1-a.rwth-ad.de (2a00:8a60:1:e500::26:152)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:45;
 envelope-from=slankes@eonerc.rwth-aachen.de;
 helo=mail-out-2a.itc.rwth-aachen.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: dPYucPLmc0Lg

We are developing an ELF-based kernel for ARM processor and would like
to use the flag "—initrd". An initial ramdisk simplifies the boot 
process, but as far as I know, it is currently not support by Qemu for
ARM processors. The flag is only available for pure Linux kernels.

This patch enables the flags for ELF kernels and creates a device tree
entry, which helps the kernel to find the address of the initial ramdisk.

Stefan Lankes (1):
  add support of `--initrd` for ELF-ARM kernels

 hw/arm/boot.c | 106 +++++++++++++++++++++++++++++---------------------
 1 file changed, 62 insertions(+), 44 deletions(-)

-- 
2.39.2 (Apple Git-143)

