Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp865289ejc;
        Thu, 11 Apr 2024 03:44:44 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUDE1ryfPNPp7zzucxg6afVuVHd+1p4+hnGVr8UfSlzkmrdWEJaHDtBoZi5fKVqE35iYOpQPo5t+zUTeGmUq3i6cjGI26Mw
X-Google-Smtp-Source: AGHT+IFidrAxjwWoq+7rHkKccBXlKmXG9Y2dzR7lKYhClK98Zg20Us2FjfzWDUui8YjKtIPuBQ/H
X-Received: by 2002:a17:906:46db:b0:a51:d056:d08b with SMTP id k27-20020a17090646db00b00a51d056d08bmr1855832ejs.0.1712832284334;
        Thu, 11 Apr 2024 03:44:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712832284; cv=pass;
        d=google.com; s=arc-20160816;
        b=fQ0Us0vC2TaV85PWOp+SA8S58is2nVfbov7Ph5Hd64hwa24drxvyhvUbtOsETBFmdR
         trkvAL7o3Tuk0jMJsuOU1xMUXahpVdY7QTogo1XEIISycISspPEzhwaiZYYbs8jlUSTv
         5SsXdwYuYFqZIkar0sf/03UmBhshwq0fUhwNuLjnCoisoqWxXE30LmHzt74rihHdC+a2
         p6pO64Db3qvCRbmI6OUHlmZp27jrQcI+rl6Kb22BNHqaWnOc7PAjyFFzMCuukXUn0oYy
         ys6x2/jQ2fEstNhs8RvUILxhAuziz0QWZRi/dW7DMUKEEZL3EiSiMOE2htGoELmGRDk1
         2vjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=7EwoYTZWhIpfsU+7LZSduNtPHyEqtMdnhAHnqEMdyEo=;
        fh=WDNhxO9ok3l0gAJ2gXlK7irstJ2IrUZIWyJ+qab5fiw=;
        b=aZKIZhbfv4N/7AmfwYBu12uN7kpCUyiRJQzmNNZFdDb3UNbl9tW5xzAWnYFh8Fsv7M
         B+M5N35BH3L50cptqloC8FLbd5iTP4kfEK3aILVKSgQnJ8bAE9eZrEymNsHpSk0GnXe+
         Iw9IGZlI6o3mqULIaloWL+Y1JAetMlf7z3vlZ7MXRul3I7uAV7ZFqEKwFuSyVqzjwAdb
         auXcb+zbOLvyjdS41k/icFmjQcC+ZOUbsNj5Z3K9ttRQKe6SZItzPfH/G11OGXf9B/x5
         HjODsy4Vb0DQFdztf8qLKJS5M0ZvnNcYLDSIbjh9vFJvTpgNDyhXaun7re8IQ2aZ5i16
         o7Rw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SelGX7aa;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14241-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-14241-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-14241-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id u1-20020a170906780100b00a51c3e3d682si613773ejm.128.2024.04.11.03.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 03:44:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-14241-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SelGX7aa;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14241-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-14241-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10F461F27C16
	for <alex.bennee@linaro.org>; Thu, 11 Apr 2024 10:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCA1146019;
	Thu, 11 Apr 2024 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SelGX7aa"
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266476BB29
	for <kvm@vger.kernel.org>; Thu, 11 Apr 2024 10:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712832281; cv=none; b=WOnA9iUMdXUyGdUTbzqzX1SKZCyjbt71m+ZSfBzP5ztpktXz4WPEbJ/Nifc1qpG4v0h/QOwd8biJTy1STUaFPcTKog6OeLhp3913aVzbEIgnj4XOKisT3pp3kcM8aeAgze9gmnZnfu/3V592YjWTIvO/BtHYLurKA6kSjgdqrSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712832281; c=relaxed/simple;
	bh=6K3KPQrxfEE/y+YW5YNWuy9E6Sk13SJ88kez6fNicpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HkrjhHsRyLZ7c+UNoKQ+PeKhuHKZlenzL6G6PCF8mmU8FCpStslgjIkUsOriSPHPS1AUU8T9IPok99iXAznzNN/dLV9Mf9UnkMTigny78r46vXQCyOCd7Rh8OlXRZiLjw2p6NUdq9ABSTgpzNkzOsspLGKLDomYS39YXA+znjLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SelGX7aa; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4167fce0a41so4156265e9.0
        for <kvm@vger.kernel.org>; Thu, 11 Apr 2024 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712832277; x=1713437077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EwoYTZWhIpfsU+7LZSduNtPHyEqtMdnhAHnqEMdyEo=;
        b=SelGX7aaq1fm8Z1uAG8Ecw0vFXbiBxjYfotfm76QmMeHG2fDuKIqMgjxgHzcDZ2u9L
         EynPpq6cPARrf8YdWojw7Xfgryl8Y5XAXejflPTmHeSwzD9WJCgjKVhULZ8CrCyWOzq6
         JBOOpKvdD2uMMUnUTRENzvSUd/UXXsywL1fEx9D+L3w9ymRA21vLydIDc2HjuS+5s6d5
         Yy4GG6mbPUJ5HTknQjz1shRUw2ILKjfs1vUbA74EYWs4T9Zbz70c0GHr4kOxbMzszCGJ
         XjlhKi+zbW4DWB7O93a6N8rwS6SkmgHe5MpmqFaBdyAiNJmbydQ/oc1IFSzlR0LLqOg+
         7Qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712832277; x=1713437077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EwoYTZWhIpfsU+7LZSduNtPHyEqtMdnhAHnqEMdyEo=;
        b=fMkUrrg7quvLA1DeNRcHehXs98CTcp3UfWWX1nZAcIExxriOPbyhWok0gvWnwYUAVv
         jJeltvMLpsDObPqUx2izdEIAKyKqTQkZ5IOawT4xDCU70sT+Ylzx0s2OQrdcHaIcpzRS
         EkUn4ZfG9id8PZfJW1MTPQrdFgQtTujUoWcUHW4mvARROBRiVhlhtXy5kodpIN55EQjr
         hE81oNanMtvripdnsfwAV9wkTVvqgqupO8JTH0iOfX2kIsyRxUF6uhV7MVMuMQKkaiIq
         vXqRm5wK/HGwyKg9kVqYjfeLvWERv/joTc/aGW5EwuO9kDJVETuJYNRBTED5/B1bBaC+
         RbMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWELHiZA7W7bY1bVILb5zygYFiHoQJNfoMqWlh77U89hn78mvXpqbRREjhruV1eT7Um+HIoCJhiWIQfYsxHHAVjPE+K
X-Gm-Message-State: AOJu0Yx6sGHHHkx8vOO4sakZlnEe0ELrxDX1FQPG7jsS+PuNhYKiKqB7
	Ut0R4q8D/0EwRwR2CXvloZS08/ZBI5VdqGa6KF9rUdgvudX0jR8kf2daeL3cN2I=
X-Received: by 2002:a5d:644e:0:b0:33e:6ef3:b68e with SMTP id d14-20020a5d644e000000b0033e6ef3b68emr1785788wrw.34.1712832277566;
        Thu, 11 Apr 2024 03:44:37 -0700 (PDT)
Received: from localhost.localdomain (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
        by smtp.gmail.com with ESMTPSA id q9-20020a5d61c9000000b00343d840b3f8sm1463776wrv.33.2024.04.11.03.44.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 11 Apr 2024 03:44:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	kvm@vger.kernel.org
Subject: [PATCH 9/9] target/i386: Replace sprintf() by snprintf()
Date: Thu, 11 Apr 2024 12:43:40 +0200
Message-ID: <20240411104340.6617-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411104340.6617-1-philmd@linaro.org>
References: <20240411104340.6617-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rbMBTh2DwiSz

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience. Use snprintf() instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/kvm/kvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e68cbe9293..a46d1426bf 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5335,7 +5335,8 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
     case KVM_EXIT_NOTIFY:
         ctx_invalid = !!(run->notify.flags & KVM_NOTIFY_CONTEXT_INVALID);
         state = KVM_STATE(current_accel());
-        sprintf(str, "Encounter a notify exit with %svalid context in"
+        snprintf(str, sizeof(str),
+                     "Encounter a notify exit with %svalid context in"
                      " guest. There can be possible misbehaves in guest."
                      " Please have a look.", ctx_invalid ? "in" : "");
         if (ctx_invalid ||
-- 
2.41.0

