Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3579649ejy;
        Wed, 5 Jul 2023 06:33:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFE3e0mUfJqorj46d63cU+GTlzgQwBV3DNeJpZWT1TAPTxKHWLOxKxkzchl7bBduSdTn3zq
X-Received: by 2002:a25:b28f:0:b0:c12:d2b:5428 with SMTP id k15-20020a25b28f000000b00c120d2b5428mr13639969ybj.29.1688563983754;
        Wed, 05 Jul 2023 06:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688563983; cv=none;
        d=google.com; s=arc-20160816;
        b=cRbkom5AFM8BRP/ZWl90yCkuh63cjEEhFCJDht2Y2ny+mm0+lTgfaTjz3tIwSsOyST
         K+n1qGz3Q4I4IZ8iMk8Enpq77/tzlmQSBDQI0FzTWKUuLXMtXvDHkiVJL7wnAPB/UN7K
         DcC8It5j13ippeTHkvJVH3v/F026QmYPdaeK0A+K8VPrpXsMMqNTPAasy64Bvn38xIKh
         1x7NMFfGJBArqvCCDDdl0aAWgn4YDUtwsBMePaJ/gS2BXEx8Q2CZyCFanzz3fWbSZFz8
         Y4i2uKCZ9egNAY7fWxVZIau9LBQ2/peuZk9lvpnJE97xqEFRBeYm+q8cU+Os1ZDpKpLv
         A2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hTQw0+m/TSUjm/E7y2FkWg7UcKy3q1iulYca/mbmODQ=;
        fh=QXqlxiHoBliGFMptr7ZMhDvY0ya7oCRNrlYjmpX9sZY=;
        b=kWGrdSb3xCBIeHsroOcEyqUtqDv0zxJqLSC1G35yLWyLhg47VYKhREHcCSw7nidOp7
         b4qUpm6zqbF66n8Nqx/7J7bpYaRQvvM88L0KbAtD8eE5X1BTFGorPGO2EzxVWvDn0Lq6
         0TsLxhs0YLfBJdkQTGABzeslXg20SH8r9vHOAPardk1gHNedZfHL84X2ByS0Ky9PhAwy
         7sjyAp6/PvzZoSgKfTQbacTvsAqUzJp/Af4xsC0iVPYgM1EIokAXSOVq6BfHZMOaK9nl
         zsank9T1l1X3E+zvd/9E/0fAPiwH5lEz760XsXu376go0U/MapW2cMaD9Vw6E/RCCJq2
         RzqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mgXBbAvo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15-20020a056214062f00b00635e5fb79aasi12764783qvx.80.2023.07.05.06.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 06:33:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mgXBbAvo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH2cn-0006WO-W1; Wed, 05 Jul 2023 09:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2cW-0006OF-Qm
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 09:32:42 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2cV-00024X-4J
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 09:32:36 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51e29964942so297764a12.2
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 06:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688563953; x=1691155953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTQw0+m/TSUjm/E7y2FkWg7UcKy3q1iulYca/mbmODQ=;
 b=mgXBbAvoJ1d/4T84vYM7w9ALmPodsi78fAF8trS6HASjpjd+vvCvsUg98x6nHSmT5a
 l8GiM+pS/kcyjazWKzCtIuwBkHK/6u4cpLELSBpdkmbDPcFeCanwpP5tMRaqxnf2gnhX
 XQ1pvvnkgC6mQ8U2wXVw6qvikeSI4Tm+pi+2aQQywp6no31K+q0Kknyud979R+hE2b24
 3xzJwbDquUDpIKKOebKsq4m6tWfG+UIFe5OTOzu1lnWt6fYoNxEXyg3prBYoFFpCvlfQ
 L38QIEQG/soeqypPOegcF1GlJ6HplJG2FalbawsxvzqZKwsIn03dEBFm+8Xn+a0Apau5
 owgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688563953; x=1691155953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hTQw0+m/TSUjm/E7y2FkWg7UcKy3q1iulYca/mbmODQ=;
 b=GVNE7uOxiNp/u5jfT2WJiwC9hQ1LVZUJL/EMg+UgulHGz8ka8IMPhu+qIw5dEMH0Pr
 v+MMLI1PN7D5xYfm4aoccTuVnjcgOT2llr3Fz/Gk8B8KlZLI+j3GhN1mwAGwneWrPhvH
 zpiSmOByBou0upk0mY059xgbTTyciA2QZE8DcZAuq9fG863uZDItm+hFQRnYAid2RfkH
 4NkvN1lvCVAmHpXS8e88wbnB2H0W5UctlNu2UujdIcmf5mBovafcI22z9tNhokzgBWD2
 oAB8uaO4t/uDzDZxr0tEZoL9mgMZud7uhWYSV8fRZnQIafPbAxwDxMuDg9S0h5Fq84DW
 +RHw==
X-Gm-Message-State: ABy/qLZ1YpbCaRRhetq0dsEEmO19q7OlhNKd2nMUv7G1ZnWs+Lr3xfg8
 0QtffYWjTyVnj7B+oGYT6Jmoug==
X-Received: by 2002:a17:906:c408:b0:991:caa8:fc3a with SMTP id
 u8-20020a170906c40800b00991caa8fc3amr10944746ejz.72.1688563953770; 
 Wed, 05 Jul 2023 06:32:33 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.142.96])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a1709065e1100b00991481e7c53sm12507910eju.206.2023.07.05.06.32.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Jul 2023 06:32:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Laurent Vivier <lvivier@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Amit Shah <amit@kernel.org>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/4] chardev/char-fe: Document FEWatchFunc typedef
Date: Wed,  5 Jul 2023 15:31:38 +0200
Message-Id: <20230705133139.54419-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230705133139.54419-1-philmd@linaro.org>
References: <20230705133139.54419-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 22rF8t5B4O0c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/chardev/char-fe.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
index 309960046a..ec3f706a14 100644
--- a/include/chardev/char-fe.h
+++ b/include/chardev/char-fe.h
@@ -175,6 +175,20 @@ void qemu_chr_fe_printf(CharBackend *be, const char *fmt, ...)
     G_GNUC_PRINTF(2, 3);
 
 
+/**
+ * FEWatchFunc: a #GSourceFunc called when any conditions requested by
+ *              qemu_chr_fe_add_watch() is satisfied.
+ * @do_not_use: depending on the underlying chardev, a GIOChannel or a
+ *              QIOChannel. DO NOT USE!
+ * @cond: bitwise combination of conditions watched and satisfied
+ *              before calling this callback.
+ * @data: user data passed at creation to qemu_chr_fe_add_watch(). Can
+ *              be NULL.
+ *
+ * Returns: G_SOURCE_REMOVE if the GSource should be removed from the
+ *              main loop, or G_SOURCE_CONTINUE to leave the GSource in
+ *              the main loop.
+ */
 typedef gboolean (*FEWatchFunc)(void *do_not_use, GIOCondition condition, void *data);
 
 /**
-- 
2.38.1

