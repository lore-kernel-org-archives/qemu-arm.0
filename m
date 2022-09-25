Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1409400ejy;
        Sun, 25 Sep 2022 04:39:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5iLZJqqnPfKVEC6Q62Zo71sMROnzbjxGSEcihWpVIptl4INxt/nGSp6SbqVun6jgmztc3C
X-Received: by 2002:a05:6214:5289:b0:4ac:c9f9:909c with SMTP id kj9-20020a056214528900b004acc9f9909cmr13361336qvb.34.1664105967923;
        Sun, 25 Sep 2022 04:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664105967; cv=none;
        d=google.com; s=arc-20160816;
        b=wf6Jzp3ghO6jTlDAgtZURCIxsS2Y6xUNWL+zb3KUDGyGwxOdyLU3sqoPGgpvDet/sd
         qj2YlNIU8OHYuXhevdMyezLzLxMiSgMmAKyTTWZQyRXF9SEky86kFs8zXxRsCFS3Ezyw
         HjU9CUHCoPnfOHZD5Hl27SFBh8LAzHjbFvZU/nRvswFLocDLEr37OEr+ii9QyHn4wSY8
         AeHti375J501R9TCWzQ3SV8b5fpfTLaoi8ZBGjdy84pZiVQlRhRo4i1f+XIhyb0qg0mk
         KSBtAzOi1rV67x5FrBomt21McmHZ4R0OdmbIzUi7QoowLJcqaD2CmCG8wXcu20z6zOTI
         Gc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6rt1OwHx0poTtFu+/xYq6h3N3Rvq3r0ijnGYMxiWCtU=;
        b=SArzcRxNxSPmc7MHSfASt5vEYWOrRd4CCzlS1TnTegDKP1bqVrEfgxsxGvnjNSkON/
         zfo9MSkYcx0moz06juyLkcg0MdEyfBzOFV+Yawo7NtEeIIFe0pIWyM8noDOci0EeAj61
         f1KR+BKslVrHIlhzyX9ZlqhzC+4GsmlPe+b90PXUjXask9tcx/roCJLVpbk2HBDFRU0Y
         moTmNCcw3pr1TRUK5H/iWGLYwyynrx0C9asZ9k8yKEJWgsb+Wn8dfGWSKGDLzgudRmuO
         +94imfDa85x3jjW3m1Tj3/SJNNjtnXW5KUqgQpw5zP59F6sqGBghehlkchpL9VHXO0QN
         OeFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=icbzfD3o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020ad45aa8000000b004acd9d2d642si7463387qvg.542.2022.09.25.04.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Sep 2022 04:39:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=icbzfD3o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ocPyp-0000ol-FN
	for alex.bennee@linaro.org; Sun, 25 Sep 2022 07:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqf-0002dH-DL; Sun, 25 Sep 2022 07:31:01 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqd-0006J2-SJ; Sun, 25 Sep 2022 07:31:01 -0400
Received: by mail-pj1-x102a.google.com with SMTP id fv3so3992199pjb.0;
 Sun, 25 Sep 2022 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=6rt1OwHx0poTtFu+/xYq6h3N3Rvq3r0ijnGYMxiWCtU=;
 b=icbzfD3or1/jGBFdIDKRm+a1PbJu/AAD9twNGAwhoJ1qRT3990fek5NtyuxVm+desi
 hZTFSsziyBitkl8ka0GEjfgWtqZLPubIfxOwBYpIMS4KGJtLn0yUl4O0tXY5fodlOSod
 x4NgAm9Mghm9c/qNqbdDO6m3zhMPtCNf/eRsPZRe3kXge8L7Exp2o89XBwnA5T9gvKca
 qWP0J/ZCwOkbrrwN7p/vD97eBk8pJf6b8SY4CD1AX0nTWaqGx/QU38eSDv5V1c75qLuR
 d89VqBwNiFcpTCJ7SCy3uvFIw/LgfsydasaHuhBs2GMaUAlUZ04OH//1fZzewjB+rPYN
 tEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6rt1OwHx0poTtFu+/xYq6h3N3Rvq3r0ijnGYMxiWCtU=;
 b=Yzbp9Ee/wiuMsA2eSJIFO/tSgZbp4KrG8wHSgDxlch7rWuxZrwj1IARCKwITzwPWXP
 QaTaOe3/utR3koUUC+F7rUbjlQ/z63jDRvijs3dPPVkG2Rx4vsMude+DiReQc5iwVjHX
 yIhanIGJOLYjD0uxVgtE6CR40xqteFumnGEJ2qqkAm3l3VehHXxOi13sjzT63v26q7xp
 xZ8NROo1wPlptbldlMryg5PY49S8WOJz9fdeAez7g5hc1C8q75tzQcTkuV/XubK3t1pT
 mlpDy5V51d5jp5G/FpQ5RgFVvu21JvWEamTHAkK6nqBUM6qLDfUB/ZxP0bT+/3U/yKFi
 xBrw==
X-Gm-Message-State: ACrzQf2SlTEPMEEQkeaL1NfayxyGeIGvQeS3eMGZTCBAOTGG0rrNaCWA
 Zzo5Umuhsod9tC8PBp3Q17y1/anqeGk=
X-Received: by 2002:a17:90b:1b4c:b0:202:c1a3:25ce with SMTP id
 nv12-20020a17090b1b4c00b00202c1a325cemr31787763pjb.232.1664105458206; 
 Sun, 25 Sep 2022 04:30:58 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:30:58 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
Subject: [PATCH v3 06/54] tests/qtest: aspeed_smc-test: Avoid using hardcoded
 /tmp
Date: Sun, 25 Sep 2022 19:29:44 +0800
Message-Id: <20220925113032.1949844-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m8gA0Z0E58q6

From: Bin Meng <bin.meng@windriver.com>

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_file_open_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Split to a separate patch
- Ensure g_autofree variable is initialized

 tests/qtest/aspeed_smc-test.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 05ce941566..c713a3700b 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -608,16 +608,15 @@ static void test_write_block_protect_bottom_bit(void)
     flash_reset();
 }
 
-static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
-
 int main(int argc, char **argv)
 {
+    g_autofree char *tmp_path = NULL;
     int ret;
     int fd;
 
     g_test_init(&argc, &argv, NULL);
 
-    fd = mkstemp(tmp_path);
+    fd = g_file_open_tmp("qtest.m25p80.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, FLASH_SIZE);
     g_assert(ret == 0);
-- 
2.34.1

