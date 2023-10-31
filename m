Received: by 2002:a17:906:7e1a:b0:9d0:bf65:29fa with SMTP id e26csp232958ejr;
        Mon, 30 Oct 2023 17:57:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEe9DuwodoFnoMsAcmXRyn4JgdvDLXtf87+VMcsbrI3Ds85ncDEF1w8r0/co9rqxc4OzwL
X-Received: by 2002:a05:620a:1a08:b0:779:d79d:196b with SMTP id bk8-20020a05620a1a0800b00779d79d196bmr14149511qkb.50.1698713852306;
        Mon, 30 Oct 2023 17:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698713852; cv=none;
        d=google.com; s=arc-20160816;
        b=RUwx4lqhk5q6qg0JzyiWDXglySJYF9RmsM9Mx6bzt9I+H/iwazbkYPLeob+fweE5qL
         nKhxiBKMAWbt9CQYkOQqgv/TvqjX+/sAVKfeGGtHnZ5WInwxp2xAZOztU0hpxPUC3Zjw
         QNwPYDLJgvZ4dg4C6KncxtfCMOg0JdqxVSiz2vSitdp7QJRxoFwjgXfM9QadyxJp/Fuy
         WueY+xKFxCILDT83rREgM8fBmRXtz1qRU+GzhJEKuvqbWnGSxKdN9ZPgplfRCN3kotd8
         pzWQc3sJty/sMnzZ+uUkxHGn6caGRWwHmMhNId5SVS3KvfQymolMs7ji22GvWunymZGi
         jBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=pVbafBFqKPatxB43OuunNmIhOS40uXwLhFSccyyX0Hw=;
        fh=LEZyB4llYflD+IPqESqY1T/UWLQlxW1ni/GVC7RTxkA=;
        b=c2GZ6MA/kKThONK+lkqK30F42xdzGYjzKM+1vXQ3IyhKdn3KDIVW+12o2Tkt96d/9E
         4K4Hji3agNPFwdXxaX3Rt1MOyxGAwQH3cZ3dpYIl/bQKt6a57z5J2QQeL3Fo7iHZlMSN
         JgrLH8F3kSRF0bMO3F7RS8/OWLGMT5poFXH8MbwkdoO1ua4w/9wXXUFnH+24nP3tSaJp
         bLWvsNQDU46uG2TnFwWHN0fj57QPJ3WRlg9QSfuuCghSlBl74aCBqEOcsFdAKVici5DC
         dMOOa9FT8pR2q0upZthZf8rT8rJGbcXlxa6inSgekWcP+DkaAh79Q+ZhkB7aW2fo4mfq
         cJnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@novastrider.com header.s=key1 header.b=e3l8YVJ6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=novastrider.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020a05620a244500b007757464e7c7si154443qkn.633.2023.10.30.17.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 17:57:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@novastrider.com header.s=key1 header.b=e3l8YVJ6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=novastrider.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxd48-0004Ut-QM; Mon, 30 Oct 2023 20:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marielle@novastrider.com>)
 id 1qxd44-0004Ui-Eh
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 20:57:05 -0400
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marielle@novastrider.com>)
 id 1qxd40-0005IP-MK
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 20:57:04 -0400
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=novastrider.com;
 s=key1; t=1698713814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVbafBFqKPatxB43OuunNmIhOS40uXwLhFSccyyX0Hw=;
 b=e3l8YVJ6xr3ozeOtPsnsCpRGqOe23k9dmK0r7nJ+PYPvd/nZ/E1JQy/dqCTdhZZ/iwKwSu
 kgD2Kk4wOKIidHw9ND9MbPQU0NZQ6TnqsQWkIV6yF9PDbWh4h9L/wplFJFTfxOR0dpzHa8
 S+aI0KoWXlfT6a25WHe7vvStUtWy7HYYOgZNGXC4XsHVvfrWI9U0aBEiiFH6vOB+5VLJBd
 JWYJVEpK+8tMRd5iFAnywwyTXecOMy2IEg14B3MLGOoIBBl1yUehZayF//f3Ugo1M/tOn0
 DfQ103+foNeBSKZuiHS/Mz6+UGzIEqSEhOXvmb145lwwEs1qE98MUunR9awu+Q==
Mime-Version: 1.0
Subject: Re: [PATCH] linux-user/elfload: Add missing arm64 hwcap values
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Marielle Novastrider <marielle@novastrider.com>
In-Reply-To: <CAFEAcA8ELCiGy3jDKjJhAd9Zn7Sse9ZSoJ6uQ=u4ROvV3rNcyQ@mail.gmail.com>
Date: Tue, 31 Oct 2023 00:56:41 +0000
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7DBF1391-69C2-4FA7-BB3B-378767DF42D4@novastrider.com>
References: <20231029210058.38986-1-marielle@novastrider.com>
 <CAFEAcA8ELCiGy3jDKjJhAd9Zn7Sse9ZSoJ6uQ=u4ROvV3rNcyQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:203:375::b4;
 envelope-from=marielle@novastrider.com; helo=out-180.mta1.migadu.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.499, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: C60S2yqp1z3K


> On 30 Oct 2023, at 09:52, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> ...but we don't implement FEAT_MTE3 yet. We would add this feature =
test
> function, and the GET_FEATURE_ID() line, when we do, but we don't
> need it until then.

Understood.

I made this patch as I noticed the discrepancy between cpuid and hwcap =
output.

The following code produces the value of 3 on current master, which =
would be erroneous if FEAT_MT3 is unimplemented:

#include <stdint.h>
#include <stdio.h>

int main() {
    uint64_t aa64pfr1;
    __asm__("mrs %0, s3_0_c0_c4_1" : "=3Dr"(aa64pfr1));
    std::printf("%lu\n", (aa64pfr1 >> 8) & 0xf);
    return 0;
}

I can submit another patch to correct this.

- Marielle

