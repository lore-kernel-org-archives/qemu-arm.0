Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1330839ejc;
        Fri, 13 Oct 2023 00:51:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaHChlQprYBdZY8V6jGcacZY3Agf+koeYAfOVgW9pk8k/JdO1aSAHZt6T7Mtd5dhDlh7Kc
X-Received: by 2002:a05:6214:c25:b0:66d:2785:a2b0 with SMTP id a5-20020a0562140c2500b0066d2785a2b0mr762786qvd.29.1697183465592;
        Fri, 13 Oct 2023 00:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183465; cv=none;
        d=google.com; s=arc-20160816;
        b=JiakkJ3cEQq9VKn/xTqKqxDjADe5fL1kKB4KeVhNKr6kiIjDt6XnKYok0QdYp0jz3R
         H+HMAAry/NGigt+7YmwKB04GVSTdTg4SJuZmN3p18uX8BTHuMG16mgVwcO8ojyUKQToe
         ObRXNf43bOuA3kuGnltyf92qL0RQPu7HHgcH9U/KJTrRm8hOF9niUuAafaMdVDTwxEWS
         phZqhNmWCMFdcL8XnqIc5eH8jkZDjQVyYmd/iH6ya2KBe/u8xD4M7NLdTgIgyb8xasY/
         axSXKgdMZ6Pvnae9mzllQZa2lz4+AWpgrVXxBECuDqAodV8MpXDEIQN8JclmoycdpYkm
         t71g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YoOAm/+YqzAoYUm0iWl4CDp2UH+g6Xdk4CGXRsLOFtI=;
        fh=mMfN/8pbWCGPBGa2UrNs8UfcH47ZOQGgOBVo8spqQZ4=;
        b=VIhErRE5M56jLRjwrZROdNhtPFA1sSNM9fauSKYiE+sfhmPLxAEeJJQzl9LFgQkFpU
         ZTqsPy37wEJddcJDLrP74NpfoBIjdHp5sxQZ4J84sx+OtVZS8vkRez+xbnUa0I9MR1Eu
         Lg1iu4OskbsEwspEtrDUVla8I3HGig7s79HGEhInimMo0F+6XHtEuWU7Ho1N8xivspQj
         o5YRdCGirIjzhNDFI1Or3F/nr+sDw56GuFXSOXGjgbnFBswPDTpdStjrLD49CaaY4mHG
         +Q8miD9fQ84bV+GwE5sOGqhPja/+0qP3TpSNl+bpb8xy+okDxZFgJuDFoOkQMMRl8Aqj
         vYiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FsBQITbq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ep18-20020a05621418f200b006585ee0fcfesi796422qvb.74.2023.10.13.00.51.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:51:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FsBQITbq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCwH-0004YX-G5; Fri, 13 Oct 2023 03:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwF-0004W4-DG
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:50:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCvy-0004AI-Hr
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:50:27 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32caaa1c493so1473961f8f.3
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183406; x=1697788206; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YoOAm/+YqzAoYUm0iWl4CDp2UH+g6Xdk4CGXRsLOFtI=;
 b=FsBQITbqVhAIboxLcvifzZNePBXJ2YLbv23mfAnqzMsXGu62w4/eTuXT+h3yvIo92c
 siATcjMsSFDqjqTpxvvaZ7pKhI3eAEwonpxfZTHNSdA10RgW5Bo61LfE1XYTkI3mRRox
 r8GROACuL69aGfYc8WAayOB4GTwu5Apuw33/yXCEzyp4Iueea0qugwb2v+ZLfMhJafcr
 70KdlCqXPhS5+szkTpP7HEFeg1dtHOPnjyQHDFaWvLubwb8zGKYUtpR6ST3AiSXbZuPG
 h43/8ujbwEr+k+z2LosZPIcFLHUqK2yDjdwmS2a2SJtohaYarY3i7mmxwmQIIGjTPTc+
 4+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183406; x=1697788206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YoOAm/+YqzAoYUm0iWl4CDp2UH+g6Xdk4CGXRsLOFtI=;
 b=IINx4iDQ+mQ/VqHKXGWhJjeyIieBT0SLYI2TC/QtSpTewh1o1/PZ5ratN/uw253Vo+
 yQzreFVXwCnfl7bd02eqOzXNnDVLdTTmlpuuhONeI6wk1N07gPu2ChafGg4C3GrTmkk/
 FWx1pzpax/qpGUPU0OaMwYcGOIaM2ljqO4jsFhR07L40XxcECiFJta8TZc4ESQt2T4ij
 Mjn0g54unbnEWH8rTBHQ0Uo0qxwry4zpkg086Hm/OKDFf6u2ZVbZVbFdrQ7SaT/5gDcW
 4E2BmM5LRYgWm8hynlQxHxhMKC2wfrTfMO7D1/+i9pyjkeP6QFESdDa0Ya39eSd/e0qF
 7UcQ==
X-Gm-Message-State: AOJu0YyL0sbyspQjOflYf2SzyTqMqUm8h6s9ONedjUnBZl3JqDf8tLmv
 agIPoGRmA8J8Bnk6Nug1SFeD0w==
X-Received: by 2002:adf:f3c6:0:b0:32d:9fdc:a136 with SMTP id
 g6-20020adff3c6000000b0032d9fdca136mr283466wrp.11.1697183406072; 
 Fri, 13 Oct 2023 00:50:06 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:50:05 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [RFC PATCH 10/78] hw/ide/atapi.c: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:14 +0300
Message-Id: <cef77c3b4f13c967f371d203d1aba515b05f3555.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: MopQcLxXfIDw

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/ide/atapi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index dcc39df9a4..85c74a5ffe 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -1189,53 +1189,54 @@ static void cmd_read_disc_information(IDEState *s, uint8_t* buf)
 static void cmd_read_dvd_structure(IDEState *s, uint8_t* buf)
 {
     int max_len;
     int media = buf[1];
     int format = buf[7];
     int ret;
 
     max_len = lduw_be_p(buf + 8);
 
     if (format < 0xff) {
         if (media_is_cd(s)) {
             ide_atapi_cmd_error(s, ILLEGAL_REQUEST,
                                 ASC_INCOMPATIBLE_FORMAT);
             return;
         } else if (!media_present(s)) {
             ide_atapi_cmd_error(s, ILLEGAL_REQUEST,
                                 ASC_INV_FIELD_IN_CMD_PACKET);
             return;
         }
     }
 
     memset(buf, 0, max_len > IDE_DMA_BUF_SECTORS * BDRV_SECTOR_SIZE + 4 ?
            IDE_DMA_BUF_SECTORS * BDRV_SECTOR_SIZE + 4 : max_len);
 
     switch (format) {
         case 0x00 ... 0x7f:
         case 0xff:
             if (media == 0) {
                 ret = ide_dvd_read_structure(s, format, buf, buf);
 
                 if (ret < 0) {
                     ide_atapi_cmd_error(s, ILLEGAL_REQUEST, -ret);
                 } else {
                     ide_atapi_cmd_reply(s, ret, max_len);
                 }
 
                 break;
             }
             /* TODO: BD support, fall through for now */
+            fallthrough;
 
         /* Generic disk structures */
         case 0x80: /* TODO: AACS volume identifier */
         case 0x81: /* TODO: AACS media serial number */
         case 0x82: /* TODO: AACS media identifier */
         case 0x83: /* TODO: AACS media key block */
         case 0x90: /* TODO: List of recognized format layers */
         case 0xc0: /* TODO: Write protection status */
         default:
             ide_atapi_cmd_error(s, ILLEGAL_REQUEST,
                                 ASC_INV_FIELD_IN_CMD_PACKET);
             break;
     }
 }
-- 
2.39.2

