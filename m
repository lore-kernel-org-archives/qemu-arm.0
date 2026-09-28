Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D7DCA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 12:40:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBAeY-0008HS-9F; Mon, 28 Sep 2026 08:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBAeV-0008Gb-HN
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:40:16 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBAeT-0001c1-TX
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:40:15 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66e4aa8d882so2986693d50.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 05:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790599212; cv=none;
 d=google.com; s=arc-20260327;
 b=CXviy/fN1jvakiVH2OYcrZxujsiDuuvSr72xRe/qayOF8s8lHg91BBxilzLQcIsuPE
 TZkytxLBwdAMmvNhlnTbXwh8AS0aHYjfQkrUFuON2ZNGw58w0TgESZYH777UGl6r44mG
 ajQ1UEoN/nK0oTMXLcHMEvOBiG26Z51AuS38E/HZwoCeJbmhJVN7byDk7mnyfjBZkNm1
 JkFzyTMaft4ulhtm2demVZnH0gpsR6yALqJ7HuY2h+b0clbuIcw9mXIkg7IxBkbPffYK
 ydpL1pTw395DF+GknTQG61kZg11sEti0/s2tDQDWA/SQWV4yQGB+suV3HT3rhU0h+rJi
 2sFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=LdGySBYbOYKph5JsskUEBkD0MZu/44MTdod1AGtx638=;
 fh=M1aGafSJrn+sOR9YjcTO2zg8gQIa0NIKaSwDilgevLA=;
 b=pD5m+IRXbotUeBFhx3oaQng5B8xTK9ql1QK2NcRVjQyhTooECSHrs7xKU99JZVbm2Q
 yz+rsk0ktLHB2VqRhwu4nc5gZTx4zS2q3CjvllFBJcLT7/gmRaON18VAxLlIqOxe6nsK
 YbM0GhW7mFabX36yQWgf3wiWZWUTKEsJmvOGEG69EnIV4VpzuC+1c8eUF3F8LAvY4JN5
 poNgaKCRcX8KrH1lG+fgooFClf/bD6ay/1ZVQcZlQODxh4Z/Bex6KObemX1g2ScF3Omy
 p41RQvqI4IrUqbriew5Y9u5MX7NsxJgtj2i1U3Ec3LcnOeArtn1Y83Z5kMJQ5GblsbeF
 eUlg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790599212; x=1791204012; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=LdGySBYbOYKph5JsskUEBkD0MZu/44MTdod1AGtx638=;
 b=gfjDLRWftoQRHbz7XHaBOn8ECAK7U1/6XvZGtaAGOeiEz6R63wWz5TMnLTeUaAZWxC
 uyqasq57LD0qbuFkcccppXz3z/kZhawswVM8RLBo4liH4xhV52a1jheFzhoHlJ0ac177
 N/30YEsM9O0QcMoPZT3N2ZLn+mAIhInu5UmfEn9wYJvkNwQ9W18CbEGTWASkaDnnEBUt
 33WNwb4R0Nbe5NmtLyQZlPOr/vT9o/35wzw6Iz2zBhl8eslzbb0K40M25g5lYlS5V/Vv
 otlbyEI3SN5DCRfi2YB51nkWk3J6VEjn8lRrw5jdcpvlgy4Gl3XEgOe0iHRfAfk6bKko
 25bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790599212; x=1791204012;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=LdGySBYbOYKph5JsskUEBkD0MZu/44MTdod1AGtx638=;
 b=Ya6qk7rfvRlu+M0idv9qOpLu/XGRldOzOK5OVbtAtli1LpxVLopE7X+tVM5RmFoHZc
 Wdc4YHCJr1RQ5dgtaprCVZ7qcD/5+wmpCPJ+Dx5sUV53XdaFweyHAG24K2gaV58qeo5j
 OrVp/QTDoQ+BmlPBdxq0XEetX7/Lnp5BiEZrQoIlaWU5cmE/H9+MSjV9BgO/StSknvw2
 AD2LtbC2/RKVzpplMmet5pxoGzO2I2Gbu1/86fNVgZ0+C+l7SIGhyK6JqGmrcdVUjae+
 FNehenAc9wE3DQk9QwNiQbFPmxW2zdRZy+A6GTnwLAFzzeSKjnCMqLUgYdBa5C8GM7i+
 VEkw==
X-Forwarded-Encrypted: i=1;
 AKwUvByOeFei9reUMW7mtR8LWTD4QJmnLcMUt+nbjewhblR/Jg/zampPyst52pbvfbKWb96TV2+wncmO2w==@nongnu.org
X-Gm-Message-State: AFuF++krA6hCTWRQ5dCBtC4K8h7ENGKwMiUEIkMjw+1oht9VfbQXPUDg
 MA1rxCS1HoyIGle326L/sjx19eYh+PwcI3u6FIWc9sTu1D5H+g5Uvi4LvdkjZF/4QE3D/fYvaD2
 9hTJPfsVZ4cTNjsVVCNk6uGGH45NAwTrLv4Xl4H23Yg==
X-Gm-Gg: AYBFou2vnBS/ZZ29WpOrZqmX2UytZolrR5Rt77RF/5B78YOf5/7cfjx+tD7pZvqliH2
 fxzJz2HV0Alb6v0o8RwIXwxUEiJEE9MqPg4PA1uzUjVgNCojD38j+eucfyjTqeWJAl8+28CN6tO
 4AzlquOOdrOFptSKiw9Jzi8ZYDKyJmA9BSvjbYZNqDtQ7tMo5Elmsy835DmH7YKYTkEWZ1REAuZ
 fM1vVG1MzZId+I34IeMajWCOIIQdrAyC44LSZ4h13/e75eB7+Eg6MhuwZfhLTqdZ5Ofbv7JrzMj
 fWAwJAobbUKjW6VpOLZG6TY7NxXOpYCvFN5sNPXZap46nc7MERtzyAbN05gjJ5WMwwS40pry8Y+
 5xnkQCysadmfcCI6RBCYjBfuazmAComavKbPi1TA=
X-Received: by 2002:a05:690e:dcd:b0:674:1e7a:726e with SMTP id
 956f58d0204a3-6741e7a749cmr2510729d50.9.1790599212230; Mon, 28 Sep 2026
 05:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260925162632.404001-1-richard.henderson@linaro.org>
 <CAFEAcA9GAqVM-G2EYrAcJ-xcAQUoHgGFVtkcMfaYYjG_78uetg@mail.gmail.com>
In-Reply-To: <CAFEAcA9GAqVM-G2EYrAcJ-xcAQUoHgGFVtkcMfaYYjG_78uetg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 13:40:00 +0100
X-Gm-Features: AclHuK84eWWLT7OaNsIKOIYTfHBN2JmGxWQrAziilKtyXU52dOdDSwMF_y4FWw4
Message-ID: <CAFEAcA9UGyZQDmuSWPfx5apVzrfYU2oBG_SwREyjUJ59OTb55A@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] target/arm: Implement FEAT_IDTE3
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 28 Sept 2026 at 13:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 25 Sept 2026 at 17:27, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Changes for v3:
> >   - Drop helper_tid3_udef_el1, because the entire tid3 space has backing cpregs.
> >
> > r~
> >
> > Richard Henderson (5):
> >   target/arm: Rename isar_feature_aa64_idst
> >   target/arm: Enable writes to SCR_EL3.TID{3,5}
> >   target/arm: Implement SCR_EL3.TID3
> >   target/arm: Implement SCR_EL3.TID5
> >   target/arm: Enable FEAT_IDTE3 for -cpu max
> >
>
>
>
> Applied to target-arm.next, thanks.

...and unqueued: this causes "make check-tcg" to fail:

119/216 tcg+tcg-aarch64-linux-user - qemu:aarch64-linux-user-pauth-2
                                     FAIL             1.11s   killed
by signal 6 SIGABRT
137/216 tcg+tcg-aarch64-linux-user - qemu:aarch64-linux-user-pauth-4
                                     FAIL             2.11s   killed
by signal 6 SIGABRT
177/216 tcg+tcg-aarch64-linux-user - qemu:aarch64-linux-user-pauth-5
                                     FAIL             2.94s   killed
by signal 6 SIGABRT
183/216 tcg+tcg-aarch64-linux-user - qemu:aarch64-linux-user-sysregs
                                     FAIL             3.63s   killed
by signal 6 SIGABRT

because in linux-user mode we hit the assert in patch 3:

Bail out! ERROR:../../target/arm/helper.c:5974:access_v7a_tid3: code
should not be reached

thanks
-- PMM

