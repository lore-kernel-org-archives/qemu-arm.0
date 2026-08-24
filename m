Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632BDC5DF9B
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 15:25:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyWXz-0005ct-6F; Mon, 24 Aug 2026 11:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wyWXy-0005bs-KN
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 11:25:14 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wyWXv-0007D7-7y
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 11:25:14 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6a3efa2b38aso6584270a12.2
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 08:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787585109; x=1788189909; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G0Wd3sJhbhnAigDSbOw80EWCSyIFhk3lURnLFBsiUDE=;
 b=S2SquJKLL320UGqf73K9Qlacfirb6HMSk6HdcrhFafDHDFynkQGximtAg1eCZynmJE
 baDd6ffpi8eG7/a9nQLOjtWNZXrRzimRf3Ps6KPqmAwWDZU2EKaPF3iOf0lxCFTODaFM
 Rdqd4ZhpUW/mvF4LhkUdSWVTLyjPTPQmDcD+aedjxgh+lOdF5oaUxwQfnkPPGAs95Q+M
 gXz3WNfTiG8/CiXeMnKt912yi//W5RUD9GsMNWcDZxcwPNq9owTmvNBpSDWAEdO9eoKC
 EtR6HCAB1N3jiaCPpLBek98jWqLJZ+6Z4vIQrdlqQa3vi+0GAD/7DVmhiA3ndOzT2Czp
 07Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787585109; x=1788189909;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=G0Wd3sJhbhnAigDSbOw80EWCSyIFhk3lURnLFBsiUDE=;
 b=YpUWJ/CAPz/Nr1LYBzMMYK8NcQFclXfK3AYkcOhsmneperIkmrg18gtrMoBdGbyvBY
 oiSff1vM3ayA824O+NL0Jmnh5VuS9hv+bslxSYR77T65JSe5imuEVPF7vu8dhDZaRVlg
 qskvHTU1wAhURBCjrtVUYcgZ1VmrVUNnehi+T9pDCJC+Zn3rNKS9ILkz21vG6LOw3wRc
 OJdEaIf5psvboFnQP7GCEbnqNPsBstOpWeTja1dXR+xjL+W6tRTDmofwdDkoOrApoBCx
 swmUidyOETgwdw5VR37JqYyCB4kewTJI7K3terxPEcTy8ZGg8GCDMFECKVQs5fUyLkA3
 iFnA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrnmaXccRj8iKxvei5TwC5uYw6amxlDYjApniPB7ODTXChbnZrOwfUB7btoRj9Xw4KtzRahMXOBMQ==@nongnu.org
X-Gm-Message-State: AFuF++m0woOgSgmcjbcvm7keybJoUGSUHFQD66oM+Zch8wVohYGx9umR
 alDtuforCX6UQ+SqbA3b7CIw19rXc2X3eU/Mop/okkowtDRzrQDmlx8WoDlNcP3bwUw=
X-Gm-Gg: AR+sD12oxW70VwXOXxqW0dprcIwpPwBzuUiitNyMrllm9J4RXOAlNJuB3TKi3oxMHBA
 /zNNL4y7Fp5eWCarq/Bfd0sVsNqIpIvQwPGpFGH2XCt7W2ui8XQ9mGfzeB1wS85eXoGGd/h4WZv
 610PBCUL3cvlA5D/b3p1Z4dSSqUMFQxq9ILpj4g28hgalYx7uWQqGKlESoKLlPHNjBeoE6ALHuS
 3ZwzWZ4Aq5W/1RD4/CzXia9C9PplgWulpmbezgrpRtQubRKgfkWRTGBdmU9JzyVkeutBrhrluzW
 2U5brYmcGfa3FUWKJvyzN2H0RVORANlxi7rs4jeLuooZ1dvZ94JbpCLhO0OzjmS+LblDZPUeO1L
 a54glhuY0rPdL+tYK/UxLGca+8BHYALX1zJspHuQhuaRbfwy3kQ/c6f8Tu1PC+Ik47e/m+wwSou
 NztOuC51u1HJvaujBMvA80GOy1zqlCm1BwZfUDszuxXNhT3vtMHfUiKMUkIA4A
X-Received: by 2002:a17:907:9308:b0:c12:695b:8876 with SMTP id
 a640c23a62f3a-c246a39efb5mr3122286666b.5.1787585109460; 
 Mon, 24 Aug 2026 08:25:09 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24966f8f08sm1282381266b.35.2026.08.24.08.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 08:25:07 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6F9625FC28;
 Mon, 24 Aug 2026 16:25:02 +0100 (BST)
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Mon, 24 Aug 2026 16:24:55 +0100
Subject: [PATCH v2 8/8] mailmap: map the last From-munged author back to a
 real identity
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260824-fixes-for-11-2-v2-8-352c6b890402@linaro.org>
References: <20260824-fixes-for-11-2-v2-0-352c6b890402@linaro.org>
In-Reply-To: <20260824-fixes-for-11-2-v2-0-352c6b890402@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 zhenwei pi <zhenwei.pi@linux.dev>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 qemu-block@nongnu.org, devel@lists.libvirt.org, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, "Denis V. Lunev" <den@openvz.org>, 
 "Denis V. Lunev" <den@openvz.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397;
 i=alex.bennee@linaro.org; h=from:subject:message-id;
 bh=NdHao0lP1Djp3lKZKg7V1dUUByr13KB4ogSPisoA2Zw=;
 b=owEBbQGS/pANAwAKAfvQ2wlanipEAcsmYgBqjGJOm4MljmbHGBaQ+ZWY6OcUDfX3DPsXn6aLM
 ouGea0w/meJATMEAAEKAB0WIQRmha6Z51FnvK/I3zX70NsJWp4qRAUCaoxiTgAKCRD70NsJWp4q
 RKI/B/4lI5UStKcb/v/9Eb8iHi2CMsgYvCZ5+PAc6ny49MWoGtFDwhbdQBX4AUcRhBZu6wHzvSo
 kVNwoClyOz14GHi7Z9wBiuGp0CUZevLKYWL5J9AHor3acqEaTndrvPKCGYnP1SM3oizvWDJiuap
 oAY4mTFF2B3wGzWdNgvK6nkLEJnu0Tmg6g3lHx4KPNXZ/1DtKhx5fNcZCkEJS25ouRm5gZZuYlx
 FmclU3HlRfi8fBO7/kTZONGAQRxdfRFvZoSLG94vqHqG4oAcStP4TmI76LqOsuA0dWK/F0wYpBK
 pW0AE1CIEZG4DA3iq6FrTSQhS0IibE0geVXpzWSEfuWmy6AF
X-Developer-Key: i=alex.bennee@linaro.org; a=openpgp;
 fpr=6685AE99E75167BCAFC8DF35FBD0DB095A9E2A44
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: "Denis V. Lunev" <den@openvz.org>

qemu-block@nongnu.org rewrote the From: header of commit b67e353863
("block: drop force_dup parameter of raw_reconfigure_getfd()") for
DMARC reasons, so it landed in git attributed to the list instead of
to its author, whose real address is in the Signed-off-by trailer.
Map it like the other munged identities collected in that section.
This was the last one left unmapped, so 'git log --format="%aN"' no
longer reports any author 'via' a list.

Signed-off-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Message-ID: <20260812112456.970371-1-den@openvz.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index e5dc644623f..08f0fa9e118 100644
--- a/.mailmap
+++ b/.mailmap
@@ -68,6 +68,7 @@ Stefan Weil <sw@weilnetz.de> Stefan Weil via <qemu-devel@nongnu.org>
 Stefan Weil <sw@weilnetz.de> Stefan Weil via <qemu-trivial@nongnu.org>
 Andrey Drobyshev <andrey.drobyshev@virtuozzo.com> Andrey Drobyshev via <qemu-block@nongnu.org>
 BALATON Zoltan <balaton@eik.bme.hu> BALATON Zoltan via <qemu-ppc@nongnu.org>
+Denis V. Lunev <den@openvz.org> Denis V. Lunev via <qemu-block@nongnu.org>
 
 # Next, replace old addresses by a more recent one.
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp> <akihiko.odaki@daynix.com>

-- 
2.47.3


