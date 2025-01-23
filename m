Received: by 2002:a17:504:17c3:b0:1be9:327d:8ee3 with SMTP id o3csp150905njd;
        Wed, 22 Jan 2025 21:49:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVTqsgxn2Kouhd80lcnf8Tq7y3w0NeEoZyNO/vdxNkjdjyaQZtr0SbZj7RloG0j3DT4Fz/XmZ4ddZVsXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFDa3vRzlJre+Je9aUNtFiosuk2G1uU/nbGcZY3Lo4saDaU8zQfp3fU4hKLx7PFxeVk6uAk
X-Received: by 2002:a05:622a:211:b0:466:a93f:c1c9 with SMTP id d75a77b69052e-46e12ab7ce5mr310186711cf.24.1737611375290;
        Wed, 22 Jan 2025 21:49:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737611375; cv=none;
        d=google.com; s=arc-20240605;
        b=EzC0ADy8XmtsQZGV0WklNMQyyOCouXR2fMtgriM35D4lQ0VI2aJxpUQEX16REHb+zi
         S6kR7HyOeB1e5anRWyeSgXtfwW0bLigjkQzGADiFNos7i/aIQjLikcHQTEOEl8cmuNF0
         Jwkv7deNvQFcgU0G/Hg1rVQCQzbZNTHhasECX8M/uRSKPQC+CccFAGsWA5TMWGG5ba6f
         c9ZT4xDRYLhv8sspW8SdZF8Za0DpsuECKq9sRKJ0mEYRVs8mqUp2Ir1oQV1yn8y03zTR
         wWD0MiTYHcJWNYzhHrZUr7qSEViN41DAwClyoLs89cklxPE/wc+1/PXLRKnplM1jthFP
         RZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:date:to:from:subject:message-id
         :dkim-signature;
        bh=/QYBajY9BTaw503gA+cHOREv391UTeiFvnlGxwD3qRQ=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=bmbGiumecEWDe55QBr2EpymxgaxpNXNPG+oEuL1Voh/ICSx5QGXpo66FPz9N9uPGXk
         FhgybwKaUVGMakGZ8Fg9HFUwdmGttEBSt/CHyiSr3fzoSog0F2aYl4tyBEYegNu+vjAK
         W3tvBX6tlX1vmRPNSHBDYBcWWSI2bcVt1GgBinwzS/wH1PgWVYzEZnYlAHqMilHHtpdr
         FiivQZLAOkSjCY/i2XRRAIEhnYMEzpTORDLYREtKecdjwcA9N2+B/IGSL0+HqMljPg2e
         L1C2DRgHO45DtvNTVX4WX5NJ5Bwx4+gIGFNZb1+604gohB7C1gY40IwxcCDbKZ2p/yu/
         oSiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b="Nrcndz7/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=qq.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e104bc767si162394901cf.652.2025.01.22.21.49.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jan 2025 21:49:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b="Nrcndz7/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=qq.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taq5o-0001IH-6r; Thu, 23 Jan 2025 00:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yfliu2008@qq.com>) id 1taq5n-0001I8-1Y
 for qemu-arm@nongnu.org; Thu, 23 Jan 2025 00:49:27 -0500
Received: from out203-205-221-192.mail.qq.com ([203.205.221.192])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yfliu2008@qq.com>) id 1taq5k-0003nZ-S8
 for qemu-arm@nongnu.org; Thu, 23 Jan 2025 00:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1737611359; bh=/QYBajY9BTaw503gA+cHOREv391UTeiFvnlGxwD3qRQ=;
 h=Subject:From:To:Date;
 b=Nrcndz7/MJJYT2oP/l2TSc7XX3MXGRBy1aPWJTxboMgKLCXBv34uMMJGyiNg6lyiQ
 6oGbqSWNBCqtUv1uI8wVgypv2Qjiew2yTS6YH0D4HLAKmYy97VQe+gkogkjhxD/7Fh
 trFROo/i8NxGWqbR//3NeoSYVOuvkKdPqsJuX/IQ=
Received: from [192.168.1.13] ([171.213.188.20])
 by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
 id C5137ABE; Thu, 23 Jan 2025 13:49:17 +0800
X-QQ-mid: xmsmtpt1737611357t1my395v9
Message-ID: <tencent_2854A5A8D69091F0E7ABFD16C824DDD11E09@qq.com>
X-QQ-XMAILINFO: NcC2/Q4ACKgy0nHzqWsNzJi3uP80zPhfDOGK5tD1aVUiARSiJey81WlRmRcq/Y
 1Yu/zHqI/kMqZ9eXYqNnshhTjy3iDE3U6xBlId2U46oiJ3yf29XaGqhOf6hLyFKipXws5Uuc9val
 oWuM7z/L24s4FGQJ1nWNvmdzeZx1b2YV5qSRYvYU4N20N58K51r0IIIw6WERoUFjZ4+jLv5C0iyp
 9oERfcdeEmkIZ8mgnCVtlwyTIS/pDfBhkE35chsXpUFLX3Kzc9du1tbBpx3umQ6OwJ6vpMUxvBb3
 yPo3j9crl/2zrSKysrP+lurLQpP8rsJOwtgJQdD/o/OJV8txhPetQ2pT5jP9B/zhMIRkCM8lPCVO
 WK1w1iGun11bRYUTpklBgbKsHhOPjyXfkrU7Dtv9szoa0MZnqkrreT8H47cuY05I8E2Gb9BY5R9a
 h7bkh4Z2suddcgbthgP/TKnu9x5czEYjywO1jUZXE6MolzPFTK+QrzIyUSRL5t+Vmzhfs/lNQXMx
 +5z3uuk2gTxZySRgu3/Y5Fg973f6TjoMSxqHvZilT9aN7kKeTqmULUSBzTE7rIcS6gnRyqIQ0UHT
 JWgAFJ817xiwBv7q7kLVFZKD2MjTkx1zvfTikcUy4CLCmNruwpL8uyWAHgKez0DNJtGR/jEJxgeV
 3vSCrrmpiYkP9+xGvTpj24BekEyRkOXdH0upirrRZzChS1mKTvcwJ2Rdy4IXX6qrrRTIUG3DQ9lC
 2XB80UAah4+dwE73BaiyfRXhFt2QEeSk3bTqoX43MtfpmAghEH8yeqTErfWJSvP1ts9JOukf3uLh
 082aprU9Zws4UAjEizsfCgzShETtvVLH3hXCPGW+ge8RAtVLLUpQqDuGgW9ehoySvbFXFLiwDaqp
 Ea3QhTDIal3tVpo/KqXHfOA6X1sg56gbDNUKBupt+dDYybxrCPysHghAKW0XMAA3b1QDTKYFRzhW
 0VHgM16zK/LxvizUzSYHPwauOXAlNYAQFMoirVrHyLdFxnpw0iPBKkuiiPeRGCBiJP2REzK/uW9B
 VVEvjZzg==
X-QQ-XMRINFO: NmyfvsrRkCkJS5MlOxeZYe4=
X-OQ-MSGID: <160d21cec795a8a245d0ed0654ad348913a05717.camel@qq.com>
Subject: cortex r82 support
From: Yanfeng Liu <yfliu2008@qq.com>
To: qemu-arm@nongnu.org
Date: Thu, 23 Jan 2025 13:49:09 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.205.221.192; envelope-from=yfliu2008@qq.com;
 helo=out203-205-221-192.mail.qq.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HELO_DYNAMIC_IPADDR=1.951, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 8J7HegYzm/mD

Dear experts,

I am wondering if there is anyone working on cortex r82 CPU support?

Regards,
yanfeng

