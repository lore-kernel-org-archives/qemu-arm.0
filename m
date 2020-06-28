Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2192877lfm;
        Sun, 28 Jun 2020 07:27:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSqK3efwuoVgRREC+6lpdcRpmTclFkXMKgCZ1Q0OqZl3Z4oIRESEhnthYdHze9jWUr769s
X-Received: by 2002:a5b:10:: with SMTP id a16mr20636956ybp.262.1593354421720;
        Sun, 28 Jun 2020 07:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593354421; cv=none;
        d=google.com; s=arc-20160816;
        b=edOcFLg8t0CWhsFKNGiPwAGUwRkmnGHEgYZ1ptll7W0u+9xqc1MYC+z5oRfO70NYpX
         FKDN7qxS+cvvZAY6jIp2XqRaHJrPvRt46MsRFGlJ6/PGiiLNAIysIN9tQy7FPJpG3bCX
         H6lvCn29BDP0oTnelemYftMTStLmALLy2cDRUIcJM1e0Tzd/gaWMDhjsymFSYNNfg+OH
         okuj/7cxPBMPbBg5dLmRzYFyMdhUGc+GJ8m9XB4tty2nNCRasPkUnMzaGaw8Ycs2598l
         NjL/z33BtY7AhxdbHzxlVeEs7NhsGtXJmjZpmIJD0s/nZiGJXBr6B7PZg5SPJqwHrcZK
         VH9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3Ex3r734PRmdu+0SSgiqE0R+VV7DrroB2AwHxTaeBTw=;
        b=rrQMMY7F/vux+/Wj6Va5MouYVLpTMR3uLiTLUCckrYkMVJEhUtC4AmDrnobWTMFiUO
         GyUGudHxONmZhkxBaljr/bTx7Twbll2f3WBrBJ9QYQ/fAuTUsINBok7Pt0qm6DQDL0MM
         046FvUawWi87eFygrTCQ7Hp9Bxdlmgt1048Gf6HAfkicT7nH6aMQ4ptFdkvBGe32BHj8
         dsIhRHXlSu+RR+Bl8NLhKHuMk6iygRp9bhd1mWBdAXLdw0F+wogDwZa93XED7cvs1wNO
         v026CxvMwM8lw/uP3bMgr2D2uTpkaXULocHz18DibnHXFr2YkaDUeRvRdGA7UFPUVCNH
         ZsfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q9HWzBbF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si31629054ybl.316.2020.06.28.07.27.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 07:27:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q9HWzBbF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpYGr-0000Hz-3Q
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 10:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEe-0006Ag-K1
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 10:24:44 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:43533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEb-0004i8-Ot
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 10:24:44 -0400
Received: by mail-wr1-x443.google.com with SMTP id j4so11581881wrp.10
 for <qemu-devel@nongnu.org>; Sun, 28 Jun 2020 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Ex3r734PRmdu+0SSgiqE0R+VV7DrroB2AwHxTaeBTw=;
 b=Q9HWzBbF+yo35jKXgazvJ4L35YG59p9Q+ZQw8fKUtN2BRUgjdPAMh16UAg5G2ncbyo
 bV5GHEz+bw3yV4d3CVW/4Rlx8OmI9rhYYA966aKKrQkEusrZudMnF1VApMg2y78Rvh1l
 Zts5KqAfSZYFXm1190hFwUGJkGK/gTBSkyuDYF5pMvSoZzmW4ljzAgfw2UFoWNp2Vp0d
 Fu2OoWMRKOYE50Tgnx1JS0aU4r/A4CI+nyVX1/r8JQCdQo4ByxCI1zkrWxD5pG5QuagP
 LpVjgiCnzaP7FZFlO7fW+YeSEC6fXhTSFFvC21SFTdIHulaCBq5vU3j3zNnUqOudBT2M
 ZGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Ex3r734PRmdu+0SSgiqE0R+VV7DrroB2AwHxTaeBTw=;
 b=naTAMeSmVxY3GkvrWGE02Hluxk0M4TwYoSGwiSf8oiYpAsAew6MjHGsymKFyRXDl7p
 6nSPMiT3f95xPXd8IiKoCyYN+7Gjbbm9vzsvK6FYv2Br1Lo8NUEx2xz86Qk9DQdw9a8D
 RZ86eUuiPUEeVC+OcN3hoC/LJ+lkrh+xI7sMKPI8y5QQqX0QjASrdt+Q7jOfUPaEjmc/
 Ktu8JEPNZ3YAMjDLVy5oDbRBasT2D7fmYhM3Zd/jEyUdwuCMbvWohMRIsn0KGUDbjrym
 o6rpClbD7YraljclgqloQOc6itsvMU41hJsKEalL9FH1GZp18yzNr+DmPQ9de6QpcFBW
 1V3w==
X-Gm-Message-State: AOAM531NdJJK9rOyAqt8bwAtYJNKq+BL1dLSU3yfkSEUPxvLlt9wphei
 GxAsCiXBbOIohwKwIvGei49CqA==
X-Received: by 2002:a5d:62d1:: with SMTP id o17mr12725375wrv.162.1593354280394; 
 Sun, 28 Jun 2020 07:24:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5321555wml.42.2020.06.28.07.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:24:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/17] hw/misc/max111x: Don't use vmstate_register()
Date: Sun, 28 Jun 2020 15:24:19 +0100
Message-Id: <20200628142429.17111-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628142429.17111-1-peter.maydell@linaro.org>
References: <20200628142429.17111-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ovJ4TiLiOBGC

The max111x is a proper qdev device; we can use dc->vmsd rather than
directly calling vmstate_register().

It's possible that this is a migration compat break, but the only
boards that use this device are the spitz-family ('akita', 'borzoi',
'spitz', 'terrier').

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/max111x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/misc/max111x.c b/hw/misc/max111x.c
index d0e5534e4f5..abddfa3c660 100644
--- a/hw/misc/max111x.c
+++ b/hw/misc/max111x.c
@@ -140,8 +140,6 @@ static int max111x_init(SSISlave *d, int inputs)
 
     s->inputs = inputs;
 
-    vmstate_register(VMSTATE_IF(dev), VMSTATE_INSTANCE_ID_ANY,
-                     &vmstate_max111x, s);
     return 0;
 }
 
@@ -206,6 +204,7 @@ static void max111x_class_init(ObjectClass *klass, void *data)
 
     k->transfer = max111x_transfer;
     dc->reset = max111x_reset;
+    dc->vmsd = &vmstate_max111x;
 }
 
 static const TypeInfo max111x_info = {
-- 
2.20.1

