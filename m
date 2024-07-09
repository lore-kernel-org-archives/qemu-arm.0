Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1560170dlb;
        Tue, 9 Jul 2024 08:28:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUeVTTk/Gi7ilDBmTWsilBJarNr/hilOPoXwHObNArG6YrmQRqV7AT/MTwfQKn82rzAuN2GYTA+6aZy9BoaD7GIsWoOwNx5
X-Google-Smtp-Source: AGHT+IHON7cVEuGvcUbY9si0wEbiftH4wtuZ8X/ILc1AbR4O88fSAK1gUdTTUT6U1Z29qkdZhP+S
X-Received: by 2002:a05:6214:20ac:b0:6b5:41cf:c402 with SMTP id 6a1803df08f44-6b61c1fb7e0mr32025396d6.63.1720538883152;
        Tue, 09 Jul 2024 08:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720538883; cv=none;
        d=google.com; s=arc-20160816;
        b=ez5npg1m7HpJ3dZYyHGlweA3CE/N4vbI+hDE0MRMCL95hY3VPp5vGDiF7sutNaq2Eg
         9UJ43lRDXTqx4YR+G8lOO+gLKMvtjl13dV/NmnGr+//yWE4yjgDnKBBmTy3NYkaCk7Nq
         NcwAqLNkx4mbWtK4AtJTpW/vWEwyD4/pxHVJ8/cGqIuXKd12PfN+JX/J/M62/Sjqzhv+
         R21S2uh5xAmS2reh/eH3XgjqrPbUywp/jzLPGUDVMywI/1lJEA84dtkNHFWhu846Hu3j
         AN/Wi23sJuVQ1uxj0KxNl15AtNX7s6ZFZw+CqFe0rm89sUlcmql7bNrYm+QXpewbv623
         T5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=achqB7NVcZRX2FNdfvoM8hvaB6H3FSzVjdNn3nYAeTY=;
        fh=zTR2DIZxB+EjUIADI17pmMbbiq3j3O+7JcocDxdvvR4=;
        b=GBnr4oVBgpNaK5W1ngZa76xPbAIKKD0AGmbV34JchTf+wJg5IhVmfDIA8B+ycAmtOs
         wJhQ5+BgkIw4xMyesH4WN7/MymS4hiAo8qhyttoUGxRarHmmW7IW9j9q17cQS5l9IH0k
         Bz+QD21LEF6AMH8FUooyXkth8C69H/uT1g6Ks0ydNsX7wDw2ELJFg/He4h9lCuvewraV
         W1uJV0seMNqD2AXQM5FsypCKKXipPtg1E2aMEZPavMQL8ChkTf243C1onk07XotYmmpd
         vx0Mq5YyvuEfvXwFOVMy+425MJ86ZFpDKY5hA+hjADZqZgH9CaLHuoLfRk8w8iYQAxRy
         It2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lxCqDIA7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61baac1d4si24091736d6.346.2024.07.09.08.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lxCqDIA7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sRCk6-0005P3-1d; Tue, 09 Jul 2024 11:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCk4-0005E3-1n
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 11:26:56 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCk1-0006Ib-Db
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 11:26:55 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-367975543a8so3581553f8f.3
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2024 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720538810; x=1721143610; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=achqB7NVcZRX2FNdfvoM8hvaB6H3FSzVjdNn3nYAeTY=;
 b=lxCqDIA7QawU7oy+j8DXnkQC9jguJPLeW16eHCIRzOSFPnPfRdMzzG7ROu46tpsBLb
 YrgRfjrGfbdXObgqyZhxsBpTPwajK0KTS5sizY5SpqicSzX85MbGgAkMsWTwha0DZw63
 C4s78J7o2PnpdndD5ZGU90ciM/WAtzAQKMhQNYg5lPMIBTJuwYbZWDIBtu9HPe5NW6Nz
 g/wkxmvbsONtOdVH3VUH8NrKiUa0I/5To0GsDi5iQQQlZcEkMbfpfGo1F9JJ8km/Gkyj
 2ZKPQirvfeA6WfcVVPg+/bgKdj495VhBBy6Xt3b/3+cBO11hp1BYxomaP2+1FeTd2ztA
 Ef5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538810; x=1721143610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=achqB7NVcZRX2FNdfvoM8hvaB6H3FSzVjdNn3nYAeTY=;
 b=OSnCj/xEHPcTkOixmjfPa+/lPepge7TDgZ6e6a9Z9Wbi/6jmOuqqUBOtbbXMUiH+6p
 HD1FNHCFy4V6kJklwYqKDHx3Hf/gJcgOArF486g4q7rpMkkP9lCbhAmWHZTR0D6emI6g
 YIUP0N5udwKi+L/rc5eeEgrFaSlKwGcu9JXuaMPhj3nrD+nVgfF0gMw/rTG3Gc+E3hoq
 SK7tJstm/89EGnxEfMXCoypnj/RWVZiQUZf9+iVuiHPmORS8MGDsDgq2f0rv6ZL6jCq1
 6/uP9TsYgejhtDMkYiNx2fZ1+dZrkoTFemLgoDRHYMzUQvxgmbV1KIwHpihBU4FRK1UB
 2Hdw==
X-Gm-Message-State: AOJu0YyIJhvrKG8D2yZoEgJjAa5Rxtjyr4AgBpjZH0vBeJDRJp/B/GFp
 IbFedvn90Wqm6BcbB5++RuS4harZ8Ut4Jw83bRvcGwwT+R3mqbutGE0stoxFGSxl/9oAKMt889l
 B
X-Received: by 2002:a05:6000:547:b0:362:d875:6dab with SMTP id
 ffacd0b85a97d-367cea73626mr1964117f8f.25.1720538810415; 
 Tue, 09 Jul 2024 08:26:50 -0700 (PDT)
Received: from m1x-phil.lan (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa06d3sm2835401f8f.75.2024.07.09.08.26.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jul 2024 08:26:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v47 08/19] hw/sd/sdcard: Add mmc_cmd_PROGRAM_CID handler
 (CMD26)
Date: Tue,  9 Jul 2024 17:25:45 +0200
Message-ID: <20240709152556.52896-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240709152556.52896-1-philmd@linaro.org>
References: <20240709152556.52896-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 8TlIV3VXCes8

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Message-Id: <20240628070216.92609-89-philmd@linaro.org>
---
 hw/sd/sd.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 216d4dfa89..05c1b85476 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1568,6 +1568,12 @@ static sd_rsp_type_t sd_cmd_WRITE_SINGLE_BLOCK(SDState *sd, SDRequest req)
     return sd_cmd_to_receivingdata(sd, req, addr, sd->blk_len);
 }
 
+/* CMD26 */
+static sd_rsp_type_t mmc_cmd_PROGRAM_CID(SDState *sd, SDRequest req)
+{
+    return sd_cmd_to_receivingdata(sd, req, 0, sizeof(sd->cid));
+}
+
 /* CMD27 */
 static sd_rsp_type_t sd_cmd_PROGRAM_CSD(SDState *sd, SDRequest req)
 {
@@ -1917,9 +1923,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 26:  /* CMD26:  PROGRAM_CID */
-        return sd_cmd_to_receivingdata(sd, req, 0, sizeof(sd->cid));
-
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "SD: Unknown CMD%i\n", req.cmd);
         return sd_illegal;
@@ -2478,6 +2481,7 @@ static const SDProto sd_proto_emmc = {
         [20] = {3,  sd_adtc, "WRITE_DAT_UNTIL_STOP", sd_cmd_unimplemented},
         [23] = {2,  sd_ac,   "SET_BLOCK_COUNT", sd_cmd_SET_BLOCK_COUNT},
         [24] = {4,  sd_adtc, "WRITE_SINGLE_BLOCK", sd_cmd_WRITE_SINGLE_BLOCK},
+        [26] = {4,  sd_adtc, "PROGRAM_CID", mmc_cmd_PROGRAM_CID},
         [27] = {4,  sd_adtc, "PROGRAM_CSD", sd_cmd_PROGRAM_CSD},
         [28] = {6,  sd_ac,   "SET_WRITE_PROT", sd_cmd_SET_WRITE_PROT},
         [29] = {6,  sd_ac,   "CLR_WRITE_PROT", sd_cmd_CLR_WRITE_PROT},
-- 
2.41.0

