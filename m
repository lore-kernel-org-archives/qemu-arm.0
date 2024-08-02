Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp1257632njb;
        Fri, 2 Aug 2024 01:45:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyJ3CBRBL/bkVkX0thj0sdYQjWNLpP4dBn0sP+MtLoEp7a/H59TwZlqKg0+vgZXbeZ1yLKFrAGn88xHfdXA7pcUrPjSp7Y
X-Google-Smtp-Source: AGHT+IHLppkYFmHY9WoZDySglbY9G2dU9Edtu1aQceyiqrdLb0jxHRLqAdWZ3/Pf+HHaSVqG0n2l
X-Received: by 2002:a0c:e6c9:0:b0:6bb:9a9d:c77e with SMTP id 6a1803df08f44-6bb9a9dcad5mr20020426d6.12.1722588340239;
        Fri, 02 Aug 2024 01:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722588340; cv=none;
        d=google.com; s=arc-20160816;
        b=pRbGAvkJC3UDaLP/eFd98OiAeYH/VJiko7kotdxnvS0mnQnSMXN69pql75oCuBjP4M
         w/aKC799+WCPASdQrtNCeWf7UArMntQq8otj7bfd3rBOrqZhdoEPA+NGPT+uBWrXsTpb
         CiYC8w+na+9CCfGEiZbWPSaMsGkVAiJW3aMcsvtodqt0BGrBQkY7x0C3dHp/3wiTCmDB
         DR9fJFE24sVYDMWDNkN0h0p+xHuDJNeVAr3tmZUrEjts8MSvx6TuOSSy8phCsoTL5TyR
         Kjl1HersZePyImLUUwFdUOpsOX/4BM+7S6ia3BzfosK3ONUYyqLrY+gAV/djA15/GgHm
         TH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=I3O5YZSXhYuYAfurIwthezz4O9A89eFbOTsyuveVgrQ=;
        fh=B1ZDO79w0pFZWr4COL41wCN0GAJ3ZwOpeBhu6XwwatI=;
        b=yAJIlqYZcJsqlWag7bHJG70WVdI38eKVGyvL9tBZgLCdo1vVq3BrYVGihMQvTvp+rP
         on42SWvaTtiSadd9s+z78Rwav5jqZn24WGwp0ZJvUGYXw0jWfFuXMNZIeUznmsN5ttAu
         qMK6yhH9bKZGOgngqSpxHXFYFGMnXQqwW/rLscF0Tzqx9h/FpkC6oz14F2RY9bqBxdvW
         DMELLdYvDIlcnQQrPPibsq5NYvlWPkBQzQ1NZnPVm5BZ7izH7AEQ8NQsdxXD+7zmyzyM
         18gUcoXjyk+r6NWwJ9uXfON9LL7hHPBBfjwuYR7xj1eH8uFAom8PpnQsSYv7X+6hue7X
         VSfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BTBUvPOV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb9c83e40bsi13072466d6.259.2024.08.02.01.45.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Aug 2024 01:45:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BTBUvPOV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sZnue-0001EX-T0; Fri, 02 Aug 2024 04:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sZnuY-0000oJ-B8
 for qemu-devel@nongnu.org; Fri, 02 Aug 2024 04:45:18 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sZnuO-00044R-Jf
 for qemu-devel@nongnu.org; Fri, 02 Aug 2024 04:45:11 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso8411782a12.3
 for <qemu-devel@nongnu.org>; Fri, 02 Aug 2024 01:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722588306; x=1723193106; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I3O5YZSXhYuYAfurIwthezz4O9A89eFbOTsyuveVgrQ=;
 b=BTBUvPOVQhfWCHhdkuub2AzL3yoZzAlHbdo63nqaVBcIpdbcdjf/ai9HHeD1QBODEX
 JzpBSwh21S41Lgog9oiq57Df6rn3iBvHm8HtLz0tyhEGBv0ATv4zhdqiqjgm0p/GNaR2
 cCzIiRZndyv/ygpjmMFahLoS1y9UyDAJFhIVgFtLD6EujzdCWXFvFMImesmDKFX9j5Rq
 jhd4sjA/uzlAvIpnqaAePhvZ3HcjKo1jZKEGeoSAXpM4PKC2JLpW3QhTu4M7j11eFKUy
 drGQzWHXkFEz4YRr05wGgtFlKyJZtTp/ae8SLzjAaRKFibv2h1Skoomb4nskw3yATNS/
 iyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722588306; x=1723193106;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I3O5YZSXhYuYAfurIwthezz4O9A89eFbOTsyuveVgrQ=;
 b=A79oDUMrMsy117pWEISO9qC8yW/473drAkxlak92PbBaST+TVVqWwE1bngVyLCJKfL
 mNKvHALQG1yk7VuRzgXjpvdiLqjvJkkvUW/Wj2wAV7/iF8QNvhXtF/l2rOaf+1e/Ul2g
 ucRCnuOBTGrjLqnOkMqp1aTYd1kTn8OWUqI0WNaGdq41Pq/eWo/Qt8pYtDReeANZqN3z
 wC9rQXfzzbMtQfC2gBXglI4HXdCX9J5TCKm3CR0ZTNxeT9DW2hAvwsOj/IDMtP8pGe6x
 IgHhPJEibZX96HD7/McZ+5MaNBBL71hBvfWO4qocO+Sx9Dvl1DkhqFwjcFpubi0oFEyJ
 AnVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOA9JGIwzCNdI/mhjqJNyV93HvevR84G+y7h/4jBI+MvmMHK2lVzuSiv6K+mxPvZoJPvRvqbbFiQc7mmBFYoXcQXDXFPs=
X-Gm-Message-State: AOJu0YzMnvtJiKYU4zaJr+GtU8NTZ7SQHSo3U0AUMWoYsSrqB/+SrM45
 5ov5ts59eLjTltanZi3tsTHi08MaGLTh9w33iaWRaY6V1QgbrUqjQfzr/EO99Sn8jWTn2TzJ4kR
 fEugeshgEEDfPMZkjSIz9j0nJBspM+M2xndtH8g==
X-Received: by 2002:aa7:c50e:0:b0:5a2:87d3:6ee6 with SMTP id
 4fb4d7f45d1cf-5b7f57f41f4mr1968382a12.32.1722588306306; Fri, 02 Aug 2024
 01:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240802-hvf-v1-1-e2c0292037e5@daynix.com>
In-Reply-To: <20240802-hvf-v1-1-e2c0292037e5@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Aug 2024 09:44:55 +0100
Message-ID: <CAFEAcA_-bfGnQRc6cjp8Ej3WKTJGkKfELzv5j3Zc-2vyNHm9ng@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Fix hvf_sysreg_read_cp() call
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: MrQ76RCfU+cd

On Fri, 2 Aug 2024 at 09:37, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> Commit 05b8d7249109 ("hvf: arm: Do not advance PC when raising an
> exception") changed val from uint64_t to a pointer to uint64_t in
> hvf_sysreg_read(), but didn't change its hvf_sysreg_read_cp() call.
>
> Fixes: 05b8d7249109 ("hvf: arm: Do not advance PC when raising an exception")
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Richard: I'm not going to be back at work til next Thursday:
feel free to grab this and apply directly to fix the cirrus
build.

thanks
-- PMM
