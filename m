Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9FDCCF2C9
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Oct 2026 10:11:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xINre-0001rz-PI; Sun, 18 Oct 2026 06:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xINrW-0001rQ-TJ
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 06:11:31 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xINrV-0007Jb-AK
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 06:11:30 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-888cbacf70eso9685347b3.1
 for <qemu-arm@nongnu.org>; Sun, 18 Oct 2026 03:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792318286; cv=none;
 d=google.com; s=arc-20260327;
 b=XXaxpQST1xfwASSq3goWu7xrJAeUK3zwA8Tlv6HS+uXkee1uejTvd9t0f4z5C6mRQb
 bQePwNSHeNc+9YsHB3Nk7BUWQChaFI2tW2VwUmbVvmWJX2ah9Zetc0OuCWtxnW8cmaJP
 CN5YI6GzqxT6HCFhPabrG3jHmKJnC/ZHvtrBSASFW99OGWOpfX7Lzh60FhkyWpTxONFy
 BX3ygiMpZqKQt2gLcapiz/04ui2RV8jPvGd5JTXXC7H/8+lXEYAbXrKC4jTTCHprjFGZ
 VbppQsBm0r8Icsjw2NLwZ6jVcOfTOYKVv6UCxT9T+mm0rmMZ3eSEuCCzfcPWCdh9LtoH
 eWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=A1mf/h4rs8yarG4cfrPSMjATG0zfwYsdn7iIaUhN85Q=;
 fh=5iBZibXtcVDohf/KUy3PTzTDti8pF2KEncBAC10mJUk=;
 b=p0yOmZIfTY2KCZ+aXe8ibY+0/KB5RaI0wYUHz3hE3JavUEbEliWuDv+ER7bjLf8Vl+
 3doOnlMfLfalSiO0RVb8qRSl1msllucFzhMv5sau2jinTf8OVpj/qVSawKZgAsRJ/Py8
 Tzbgv1Q8UBg1Y3IxkgO6KsgjiJtXv0B9emV6QeSW4BM8+RDVOjWVLbAyg5VtvarP+n9d
 13mniuKqTP2DgkI5PPjxD3rrOfJ7qhLImiGQGfdcBrj6VFlUUE8EAYv7CG1Ni2dAtA5d
 ZgCIdLpawuoesQmY3YgsIyW9ot7wwux29MW4vrtnqI3uH/7mNCtcmlcP4QpGETTmoAJl
 3Tcg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792318286; x=1792923086; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=A1mf/h4rs8yarG4cfrPSMjATG0zfwYsdn7iIaUhN85Q=;
 b=bir43h2SEhGtTZ3BGy7HXecijpnkwXB2QMzb4M5iLHE47102u/ZFxevMSwJHEqwG9r
 WhOcmH09frVkrEEy6424ktk0DeodGiWW07Chz3JlSvMXecFnUjPr/k0WlAV99E820Dbb
 eYEQEvl0c0ZOAVDoQ8091ZnC6VwsLeKtoBtOFWXoYLJQEZ+9lesJmlYryUbn3Bba3JD3
 TEtb0X9edC7tzBgpVB8SLJjn4aRS4DEB0X3ZGa/76oCybBIPmTk2QS0gjaKkPo9vdmxG
 X38ZW31/hAvUTfSvQ5z4nsHXcMex8Dn4NzvTkc4WpL7GUkcm1mXOe2NYjlQnfvLrYJhY
 HDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792318286; x=1792923086;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=A1mf/h4rs8yarG4cfrPSMjATG0zfwYsdn7iIaUhN85Q=;
 b=YUrkOmCDXHPoY/oiQ0i6HU6bVRoQgkHx0POinhFymIxv+pRrF1ScEr3Q8nkcDTCuRY
 qzNFSmHcu1a9wPRqsGJWvboYvgM+BxdyFdUzIKaCREOhIWg6tANxQ7Ve2+GdiyK3Zlx5
 oNslMk2+W0H8v9DuBvJewhWt4blxgg/5DN1UMszn5/id9iy9pAfYsTgaYZdFX4euPwSP
 vMCO29B3TUfYGxbtdQlbwP4cq0dmg4g56E28hbVgybVA4YqlRZ19aZISsk9p6Nx41QNH
 6KKfl0ISfZesg7wlm/E30uvd8wACbM2vjhGPh9CnKHsofdq9IL/j6D1UcGrE1tSdK/OU
 i7UQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwNwHrywm+LK/MJQnwnMVvHbCv1yV918bWGyl6LhX9qENHnMXv8g1mEpmaX3TUI26i3+Ep2TMiwWQ==@nongnu.org
X-Gm-Message-State: AFq9FYJPb4fu8Lj8yygFOJOXudfIEVwDlvs+E14atI+unTRW4UuWspa2
 Fw9KBnXs//7NGpYR/hBQRpO2gyRDPH0V6Fk/C6V0f/gslHgVcV88EqZWj7mM60Un6WNi639EcBI
 z6V7DJvPsbZMbDuyXkkW7TPzsRbDIFkPvrBdF7CuxCQ==
X-Gm-Gg: AYBFou35v0qH5YJVx0Spu2xMFR4+vZKQ49O6Y9NIuoLQbZBVCh3fLCV+kl847ECgiDc
 L1PRTsNOEd/ZclnUsqiAOZj8gtVLuN8Bm2r2bN/o4iW2xeKVBTiJWluKa33FAjgtZABQdVsDnSN
 yNc3kseUk73IKJTDBU7iW1PWZxGtG/JwY7Zc3BPNUN6vqIbsO8vOEIZRJHJu2iRmRijmhwPk8TG
 oVtjXuGuFgeYLjsmX1LEQgSWQK2gvJppVkqRXXFj5uN8d9Su+HrZWoXGXk28lt6nJNcGEoI/d9N
 mad7G5MCW9/ForqA4EFcZ8l33FTFcmA+oPszRQ0Ti2J2i/GlyvGVkfDcVH41jXvrdqpweZQ0SyT
 qDeLpbx8Pq2lI1pyGbqATWNqvDiANRUQWyjaWC58=
X-Received: by 2002:a05:690c:e20d:10b0:8b0:a1d3:3823 with SMTP id
 00721157ae682-8b0f218aa63mr11066417b3.24.1792318286504; Sun, 18 Oct 2026
 03:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261017-allwinner-gpio-eint-v2-0-82906f440378@gmail.com>
In-Reply-To: <20261017-allwinner-gpio-eint-v2-0-82906f440378@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Oct 2026 11:11:14 +0100
X-Gm-Features: AclHuK9ta7VjERKJ8di5c6DCthpbpeQis8bnLohayA6tZw3xKhpXZUNotMPw520
Message-ID: <CAFEAcA-hLDE7k4jauuasJq=3XD44s7kbQ6iEQa5dxkZ8ROZJCQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] fix: Allwinner GPIO interrupt handling
To: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Sat, 17 Oct 2026 at 10:15, Strahinja Jankovic
<strahinja.p.jankovic@gmail.com> wrote:
>
> The original patches assumed that pin had to be configured as input in
> order to be able to receive interrupt. However, after additional testing
> with libgpiod and gpiomon, the pin is actually supposed to be configured
> as EINT (0x06). In the following example with PH1
>
> root@cubieboard-ng:~# gpioget -c 0 224
> allwinner_gpio_read [PH:CFG0] -> 0x1061061
> allwinner_gpio_write [PH:CFG0] <- 0x1061060
> allwinner_gpio_read [PH:DAT] -> 0x49
> "224"=active
> root@cubieboard-ng:~# gpiomon -c 0 224
> allwinner_gpio_read [PH:CFG0] -> 0x1061060
> allwinner_gpio_write [PH:CFG0] <- 0x1061066
> ...
>
> The CFG0 value on the lowest nibble changes from 0 to 6.
>
> This patch set fixes that behavior to expect that pin is configured as
> EINT in order to allow interrupt-related functionality.
>
> Tests are also updated to reflect this change, and a new test for pins
> configured as input is added.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
> Changes in v2:
> - Moved changes to the interrupt handling tests to the first commit, so
>   tests still pass once the commit is applied.
> - Kept new GPIO input test as a separate commit.
> - Link to v1: https://lore.kernel.org/qemu-devel/20261009-allwinner-gpio-eint-v1-0-c55d2958ae0b@gmail.com
>



Applied to target-arm.next, thanks.

-- PMM

