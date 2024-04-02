Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp3989575ejv;
        Tue, 2 Apr 2024 07:25:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJDxweXrNj34C4GQ3IhQFO7z7eVyEpmYEMusrD74xIsvGxmT7VMoJ1qYeFkhJ+hGzUIIkAHp2FvCxhhk8rPYeRrcRSEP5p
X-Received: by 2002:a5d:4b08:0:b0:341:8c2e:5001 with SMTP id v8-20020a5d4b08000000b003418c2e5001mr8389613wrq.64.1712067948492;
        Tue, 02 Apr 2024 07:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712067948; cv=none;
        d=google.com; s=arc-20160816;
        b=DMeNs8B8U86rGRm/AG11IJAmLC7ei0sUmQJuRYRQ97N3HeSn1DUx2NWpUGb0oJ8R04
         w1E3gOBPrZciUj9DOBI4u3gNmVkFhXZObLepdeUawsuEsd0nrVbwFypo7kRXK1fIMUZD
         ZWuREk6AtL3OfZ9Lrws2Mt0dUJc4EzowYlAZ0UYTD6Se4d13plkeGevb3dY+SggFPUv1
         fgHLhkrQKuuERUBfvwZKx/piCwwRePcRcNJdh38W+nLggWeP95ms+tFZQDbE6YmhncEo
         GggXbU8AsyNZPhchKQ9tyuyTMfFMFk8uPoB9CleQaiJMetQAsettJ0JzFJqNJnTCl8YI
         /CaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OjdzjLmAnFvDVsex65dJCtrM54ZeLuGIMveMRxi+eG4=;
        fh=zVFS3M07hXP25ss8a2D5ackuj5+nylQwjZWKN4F+qPo=;
        b=eL4sdO8Siy2JkoNswlUmkC80ORCJbJIWIaXwvefxttW5jwLtneNVCEOBPOPoEHqZdH
         lLGaacta3XJEOFcUuDu4RapzEFq6IEJdIs0wAdvqC1k1OR3hDXmy8wexXhyu2imZyVMn
         aQZL8xuGZUylNUJUPzbrPMjZUaImQ5Pso4CqBOBCSwxYXMToYbeSlWKshuPqNurSKxLD
         cTNALlmy8QqCjyn7WCrVmQCfiP5a3svf/+bYsUkWdGlm6Cy6bdt+ua/DZ1qgc2dyf+2d
         0HxHGom3VqbUcKrkBfMyBmXvxp71kk484yfh23f5nOxAP+RYOEUrL9UFKVO6u2zeD9Z+
         Kf2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WY0yS2UR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l3-20020adffe83000000b00343792543fasor225450wrr.6.2024.04.02.07.25.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Apr 2024 07:25:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WY0yS2UR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712067948; x=1712672748; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjdzjLmAnFvDVsex65dJCtrM54ZeLuGIMveMRxi+eG4=;
        b=WY0yS2URjDPVdy/vjSGNL8BqQqMTX48aZU8xd3bNK5lWqfPgjXumL7DWru+n8wTgun
         xl/41deQJApMdav97gQwvIc9YWAKcHkt3xJYcv1X5OuzajTgp1VQ01bKsIpkHKNlZech
         ucyK1dAvX2efa+IMIzgG6YguOO4MFOrf+1S7ucFuYFIV1MD1gYUHGnv2JnkMf9CEljy6
         KU7wDRpXg1s2EsNmVQVmpS7ZXucGf5qnSas3Nsd463EQkuzdx5G7bQLlBgAYePuj7QjI
         M96Xb0606EzkOjzymdLnv2+dla7hygHDpSogdA+wre/Ul+ii9sitaGcSAv50WbL/C+FH
         1aUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712067948; x=1712672748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjdzjLmAnFvDVsex65dJCtrM54ZeLuGIMveMRxi+eG4=;
        b=hygTSuMdCYau2QCO7uYlLuRwDaG19yZctikAvZkBXSSjh635365QrsE50LBk7AbSeH
         1BQQlZfMZaEfHAciz2RGOnbxFKgCCmfNOrUY8BnTZ/urR1kL3wnm+WAwx/iyv1wRE9H7
         KHZJjHWxW4z4DA/vlJoG4qCOjkeh0Nf4I+fQP/E2WO3wA1+85+ejr2iGeW/EzBJkv1x/
         Bn69iRogp96V/jAQXjBSAGhc161aw2SRM6f3eU6e67qMcZdSzBouRlOjgI7ZVeiqr8V4
         qr26t+VK8XgEG8UZ37s57RpB/C9I98/ep+A9BPdwolTLFd/9HqANmnDmm9OnwavmuOjo
         48XA==
X-Forwarded-Encrypted: i=1; AJvYcCWb2n7FETmfozJlWIc1CYYDSkMETHLPPZ/UjT7pLML6LkpjmKpfSHb7xuhGPFgNoF/zR8CH4Kb4wnK1dmQhcypmEYQznWGY
X-Gm-Message-State: AOJu0YzRCm3j7oGfum9IQ7vtuJrfbQuLqOWI/SYpnbgyhB5ivXPumObB
	xSyUZXRsQ7+iE5aTMk9Y1j3DDj2iP6izMKPhITnsXzdOaAWnPA7KG36e0xv19TkHKg==
X-Google-Smtp-Source: AGHT+IGYcAMyT0ce3AxxAxntLH9Goeq/9HJoQOd5CAofmb0FvpxhwPE554XSFu0VKUJa09jGvh1mDQ==
X-Received: by 2002:a05:6000:1a8a:b0:343:39a6:45a1 with SMTP id f10-20020a0560001a8a00b0034339a645a1mr9792770wry.59.1712067948073;
        Tue, 02 Apr 2024 07:25:48 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.202.91])
        by smtp.gmail.com with ESMTPSA id h18-20020adff192000000b003433a379a51sm520722wro.101.2024.04.02.07.25.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 02 Apr 2024 07:25:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 11/15] plugins: fix -Werror=maybe-uninitialized false-positive
Date: Tue,  2 Apr 2024 16:24:26 +0200
Message-ID: <20240402142431.70700-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240402142431.70700-1-philmd@linaro.org>
References: <20240402142431.70700-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6vQcsCeptgw7

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../plugins/loader.c:405:15: error: ‘ctx’ may be used uninitialized [-Werror=maybe-uninitialized]

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20240328102052.3499331-15-marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 plugins/loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/loader.c b/plugins/loader.c
index 9768b78eb6..513a429c57 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -390,7 +390,7 @@ void plugin_reset_uninstall(qemu_plugin_id_t id,
                             bool reset)
 {
     struct qemu_plugin_reset_data *data;
-    struct qemu_plugin_ctx *ctx;
+    struct qemu_plugin_ctx *ctx = NULL;
 
     WITH_QEMU_LOCK_GUARD(&plugin.lock) {
         ctx = plugin_id_to_ctx_locked(id);
-- 
2.41.0
