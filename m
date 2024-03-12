Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1675186ejc;
        Tue, 12 Mar 2024 01:25:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUIDLSTCWgqjlodM5+FhuadNYd+YyIzM4y+G3niQb4yK2AQdc0pVGMvUYxC3UBMo7O+050M/kHvIKoueTrm1p2P6/R9aMv6
X-Google-Smtp-Source: AGHT+IFDqPuOTDSfj+tnHn81u/7QXjiloMuJFcbwsyfQ6FrqkOoh4uanT6cpmUSIiL9i8iycr9pO
X-Received: by 2002:a05:622a:353:b0:42e:ea30:f4c9 with SMTP id r19-20020a05622a035300b0042eea30f4c9mr11911405qtw.43.1710231933945;
        Tue, 12 Mar 2024 01:25:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710231933; cv=none;
        d=google.com; s=arc-20160816;
        b=qBuHQDN/6amv5bVMuyTzL7XI1Vfpft3PIYwoph2ICyVg4xNopksHxfxusBDzm0cOli
         wX9KmsA8ZD9ai+bSqZAlwl3iCqeyoAU90LTLWlpmuejuTTcn+7Snd5PaU7dwQtx8fu8R
         1xDpOZEhYFovQBj3mi1exNzRAy+5n7mgl9jtVhCI9oteQcAfUuef64SOgTIPFBrzG4jT
         YtfQy/e20c/wp8R/9y3BnEHMDlgTCgqdmEHejyPk4IiQ3QKLtg/Pp9xXUfWfKblaScn+
         eWFEYhHMooVR6BigHM33tLcU8LsuiO1DWbGmSsPqkFQjgnsBKq6eZhNOCLd4pMaBWdHq
         tMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6MhT9qADAUndB9gfklgv3b9HSVnHfN7uCmsIepMqwLg=;
        fh=jnmTtPGCHxpieIVrxvW37jrxQzoKuu8uEJpd0WuCVZI=;
        b=OG+yoXnDo30piNuQZoFLXLXdvf1UyognT++gw1OPp4Mn4QcU4K3h+Bugg01qMPA2Al
         J41t8PQEcGuBHlPu2VOuIkKh+ejX9N7YbxMbTX3pHVFul+LTQJz8VYEW0isK28HjR8Hm
         mi4QsMa3CtoPjBjLBTmcd/UHEHt84XsybMrmFsWKeI417tWHRwv+Y0XOIN835du8m+iq
         Wcg/Fq5ROP1+7lyCsqNiA+pR2xfZ0CatOWtSCgCJfIKQ4Hvb0UmC9ntoCra2IqYYdSH5
         FuQfGRpudMCkrDNfU9hY3pAQp5hrYX1C1H/yx8PhZb/2skRffxyz1GbY7fxVA+B1V8z4
         d8YQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xWL/6C/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a05622a121400b0042eec5de503si7083038qtx.155.2024.03.12.01.25.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 01:25:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xWL/6C/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjxQy-0007sW-96; Tue, 12 Mar 2024 04:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxQZ-0006va-Nr
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:24:08 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxQX-0001Ir-OW
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:24:03 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-513173e8191so5376472e87.1
 for <qemu-arm@nongnu.org>; Tue, 12 Mar 2024 01:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710231839; x=1710836639; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6MhT9qADAUndB9gfklgv3b9HSVnHfN7uCmsIepMqwLg=;
 b=xWL/6C/BEhhR51C6D4BIFCZ9he3dZhe3h8yGjAGuPxPUynaUstIjNGhv3hfM8WHMUr
 IpbDVflnh/lI4PFxfYZU/he+8bdUBvD73vaVLh5IodJ7TY/9dfloteeu8sIVgfk4d0t4
 XogbT/MWRl16O9NXDorttmePUj9RV1xsKVWPSsbNCAClCvbTDYmBE8rPVj8lUBg5kZIn
 6DaVzbTaZTDAubClBWVxE7QTrD9gjqKu6WOid3UV/ZAwbcHOP+9YDtIv0QyNLEY+8NEX
 TigUGhlb6D04q+t5fA2n+DLe5Z+CeoUhVf6+z1S/Mm5qllXInkRPPCw0+qR3Z25Du7r4
 v1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710231839; x=1710836639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6MhT9qADAUndB9gfklgv3b9HSVnHfN7uCmsIepMqwLg=;
 b=iSkxgyWPnGqwaWJ+33HXsBb4LWeaoLW+9o3ErtF+FIbb2SB5JND5VctMZi2WMBfLEX
 ehmhp7BCcAEpvpPP/w3RUDl8OlMnV0OYXTqoFrI8rGs+jcfvBKiOA6SGGj676fZ2DM8N
 e0fZbZTHztY/kS86l12b8frjnvIPog2mT5f0dFJ/9ItvivVeTDOF898+GgKCZmDIkcz0
 vdZdIVlixGKpNf1qynHkon4BnxUrCD5i1To3KBXxhTkLV9OTHWIiHdxJMzPM5DXtm62/
 +3Jn+HJQsKSGkNwM58XLAs9vWdywDcTGnWGspQEHIDqlm/RLMga2SC9n29/XEYqkSHHd
 VQOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU6Mnqp8+obeHtLvIltglqgXhNGYTFsX5EuZowO3LuVZp4HmKr0mtWtLjKtRm/tGFH/qXIRYPinn93BE2tKbgaAxbb
X-Gm-Message-State: AOJu0YzgE90iDHjedRYDGZA55E9LWWefjCVTK8/ukQuaAIIoSuhJVLze
 xbU3pGXzVZKs64AxmGLgmZpHPhC/P19T285IUPPFqxyZ8Pu4Dbr/DAN9C32GvjA=
X-Received: by 2002:ac2:42c8:0:b0:512:d78e:90fa with SMTP id
 n8-20020ac242c8000000b00512d78e90famr5379719lfl.15.1710231839612; 
 Tue, 12 Mar 2024 01:23:59 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.206.139])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056000022500b0033e712b1d9bsm8482375wrz.77.2024.03.12.01.23.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Mar 2024 01:23:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 12/13] meson.build: Always require an objc compiler on macos
 hosts
Date: Tue, 12 Mar 2024 09:22:37 +0100
Message-ID: <20240312082239.69696-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240312082239.69696-1-philmd@linaro.org>
References: <20240312082239.69696-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: bQkPdJPGqHn1

From: Peter Maydell <peter.maydell@linaro.org>

We currently only insist that an ObjectiveC compiler is present on
macos hosts if we're building the Cocoa UI.  However, since then
we've added some other parts of QEMU which are also written in ObjC:
the coreaudio audio backend, and the vmnet net backend.  This means
that if you try to configure QEMU on macos with --disable-cocoa the
build will fail:

../meson.build:3741:13: ERROR: No host machine compiler for 'audio/coreaudio.m'

Since in practice any macos host will have an ObjC compiler
available, rather than trying to gate the compiler detection on an
increasingly complicated list of every bit of QEMU that uses ObjC,
just require it unconditionally on macos hosts.

Resolves https://gitlab.com/qemu-project/qemu/-/issues/2138

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20240311133334.3991537-1-peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index f9dbe7634e..e3fab8ce9f 100644
--- a/meson.build
+++ b/meson.build
@@ -66,7 +66,7 @@ if host_os == 'windows' and add_languages('cpp', required: false, native: false)
   cxx = meson.get_compiler('cpp')
 endif
 if host_os == 'darwin' and \
-   add_languages('objc', required: get_option('cocoa'), native: false)
+   add_languages('objc', required: true, native: false)
   all_languages += ['objc']
   objc = meson.get_compiler('objc')
 endif
-- 
2.41.0

