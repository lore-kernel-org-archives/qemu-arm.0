Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1151427njc;
        Mon, 9 Jun 2025 07:17:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpNljo2sHx+iz4yRamVHNnPIOoexrZVI5r2dmLq7Hj3ZYErufLr/fBi1TTcwiWRfwBOjrhZPkHCs+uIA==@linaro.org
X-Google-Smtp-Source: AGHT+IF4k68rf2wQD8xsk9Zy9D6bF/fMDNKOMNyDrJMQ212eY7f1vxEwOliJ890vI/Xob6B+9bkJ
X-Received: by 2002:a05:620a:4095:b0:7d2:2780:c6e9 with SMTP id af79cd13be357-7d229862ef3mr2092479285a.2.1749478603453;
        Mon, 09 Jun 2025 07:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749478603; cv=none;
        d=google.com; s=arc-20240605;
        b=DhIDFAj3jDCQgmw6dCQMS1zH4y/CfIdMY+Tj+UJxic8G76L8n5zC1HRL2+XHV1r873
         mIW0FuwKcIo9EtNedlEh+Ezerm3YoJP0jq7WuNx48xnU2lAb/qMKEEAHJCYdcxzTeFkR
         hs6sSDW2uBMNOiM8rJMJhv0xA5CMGi7IJ7ObQXx2R+k5+Y/5TLsCI2as9MVKQn9j36cH
         zOjnlcYvt/s5CNMQwQRTZCAhyiWNJGVjb93SNJsWs4EB1JXpGMBj6WZVHAkGd5E59Fdy
         aqTNpjKlelVJgQKghWlr1SfGcCMLJWL+w14N204jRwXTJ7dGAqpAkgio7q6oM7hT/m23
         c0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bQIYhQQ46/3GiMg3bUTqo+IUCnHVfCM2joGVYy0qM+c=;
        fh=wasvv0eGVZBy3gZNxaXj31ITBGw/CpGxqjprmPadPm0=;
        b=K3+zIKjARqvyAT2HT5lNMIFxXa5KoLjok71jprSvJaGT216Qj+3oesh3vagWDswNRp
         Knlq1GYyo2iszseSw6pT1kBFyS70MNfQ4L/9DHsm/s9Isr/hj2byotttQfwvbLHHHMIL
         BGUMw+df8EuUrCQEX424fhayOVizpm0Dq4TUCnXqeuugROuJZK4ZLZaKcwLQBjrOJtQe
         ETIji2YjbR1Wdr+XneecoN3gJAPqws3pCdpnovyrLKbUtPkQ3AN5AjvJfga1D8wUTU1r
         CaO7JourMzP6wSf8FaaBV785+zpBXG9Xv8g4jZp/vdtkrz2HgbIOiNlNrik1JwB4m1Kp
         f3Eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XySB8XIt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d38cb09e76si468041485a.590.2025.06.09.07.16.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jun 2025 07:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XySB8XIt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOdIU-0004P8-Rt; Mon, 09 Jun 2025 10:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uOdIL-0004O8-AL
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 10:16:14 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uOdIJ-0001IZ-G7
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 10:16:13 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e733a6ff491so4215957276.2
 for <qemu-arm@nongnu.org>; Mon, 09 Jun 2025 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749478569; x=1750083369; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bQIYhQQ46/3GiMg3bUTqo+IUCnHVfCM2joGVYy0qM+c=;
 b=XySB8XItjvj0RbcGHpnVFRkmW+R8DmHo6vM5pye7xsBNSPIEDazA8O0YcySwqcw2pn
 aK8PNzVHeE/vQR4p2LVPczwpmGDiYwExZ22eTBZGuLP8yy8BodWrzKDC0pUH3nU3U+mf
 6U1VTeLFifaioWqy2ANEq4eJBCfR3r9uZBkSxYYyQvPT9f3XK+w/zQ90L7de3dCtqy93
 jbN92qUoyp0ST0Z0/SIEOeTyIDheRZ2M2GTz7S840G4M7BKApAcd53QA6PTpEvPWwleO
 WXzS1tSgiAHpD9538Xn8zsk5K1JEVuGb8tKQ2OfNNgdT2CkEjInmWoR3EKh4Q0rvjkL4
 rLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749478569; x=1750083369;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bQIYhQQ46/3GiMg3bUTqo+IUCnHVfCM2joGVYy0qM+c=;
 b=bKBbINLPoxILh0FNtYD7KdjwV/YwsxRBCny/F1AV/iqqWtz0OMmpq1S93GF/tBF1pi
 7CTzlKCXHqHUFbBdSgm73BXqqeaFe83dc4Kg5wwBB7vmDA0EAXS9ubCoCe2JQoPNqRnX
 pfwM2CrF9qqa6rENMKyGRkuledc99mpQ4u2Y5ZZoZ7cxOIxQTeZY8ePxf94f/YpEE1TM
 XDl4WhWJmRvSWG9IQ7mUQ7sNJOgEwCbwboC1awksmwOGZ6yZFiDYaBGJRK2pbrC4CN5R
 gIO2E7jdEzQpKKE1bTWN6y2AOhGvbRRdYXU+B2LAm9dzQyhuWUDtTkNpbzZiNwNrHTs3
 iQ8g==
X-Gm-Message-State: AOJu0Yx7r+e3nbokWUnhMQUi00i5WKGsr1JKJXNho4n3dvUw6hJ8opKc
 BAxkE4g6yoS+tmC7I1p2gJubCqAAhEq0t8G/9nDGM1uvuAEUAZ5g6XCq5Bz8oMstzwNUu2bcOiX
 JHXyFDdc5le9pkq0KOI98BjUYE1UY16z34jMyj38DLA==
X-Gm-Gg: ASbGncv9nj9q4EPRNanYGky1xMK+38CuR5odqjNuKCp9ftpMru5SpqpI9iaOF1ozUXR
 AxQwDoXfry/MxveWHVPW8vj+Cq9D0YKEYJnHO8Lqn9UPklskWxKqqUj+j15Sm8W4R2fy0V2vlWW
 wgtO5ENN+xAG2asges5FgVLISwtHWqKgxDfw==
X-Received: by 2002:a05:690c:4b81:b0:710:f738:7125 with SMTP id
 00721157ae682-710f769a871mr196083687b3.19.1749478569516; Mon, 09 Jun 2025
 07:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250603101526.21217-1-thuth@redhat.com>
In-Reply-To: <20250603101526.21217-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jun 2025 15:15:58 +0100
X-Gm-Features: AX0GCFv42zoJTk9_HqDN9y9K06QDDEO7H-9dqbRdWlvcJqpqgMJsig012zjrwzY
Message-ID: <CAFEAcA84xH7t=8GQW5ZiVGmYJ4uet0ddS4ip2C1GFyN+yKxmFg@mail.gmail.com>
Subject: Re: [PATCH] tests/functional: Add a test for the realview-eb-mpcore
 machine
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8c5GIQOrw7rd

On Tue, 3 Jun 2025 at 11:15, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> Check that we can boot a Linux kernel here and that we can at
> least send one ping network packet.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS                           |  1 +
>  tests/functional/meson.build          |  1 +
>  tests/functional/test_arm_realview.py | 47 +++++++++++++++++++++++++++
>  3 files changed, 49 insertions(+)
>  create mode 100755 tests/functional/test_arm_realview.py
>



Applied to target-arm.next, thanks.

-- PMM
