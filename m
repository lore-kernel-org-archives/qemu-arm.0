Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp557243lfm;
        Fri, 17 Apr 2020 07:39:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypKRKBXBBjlZAUP2kw0oa+4CuahcBa9Z0CDJoupDiLjehOau4d//s+rMNjnsY5W9sC+O8+GO
X-Received: by 2002:a37:a046:: with SMTP id j67mr3616875qke.286.1587134392736;
        Fri, 17 Apr 2020 07:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587134392; cv=none;
        d=google.com; s=arc-20160816;
        b=p/8mM9jx8gmiQaymdmO3EjmIzEqNe1vQdfQgESEfJnsqgwzLwwI2Vvvz8VomT420uG
         i7zEkZVukSto2PQUtt4oxX73tobk2KR/FGFhW8EeyoSwR64zeQxvFfdm0c5SCIb5L3Q1
         8dadwqoNW6P2etpU0yimSWLoFb2vNFYOC+Fic9vxRfejmHAY5HfKUT7r8aTg7GCXwlqb
         AoSvPXvw4pRcdyckJWRI3y/opaZ66Zf1u+DZXKhFlWeElvh0UywrpTNns5C1fHzMV2iG
         FIyAqSgeOxjlIYLEr0y/0tl9nb0n4FMJj6NXya4OQHg+DlLuiWZvEPigTaY6g2bcHEQP
         ryTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uxlKud17Uh/JE1mXX5DzuYbWjTMgUf6k6sjjaPtZFQA=;
        b=f4Zz0X6NDXrvQiNM3WB0Pb8yEZ54ZpU4eRMSC/G47R1Awwpj9PqXFHs63QEHbA0QUv
         C6N7TJwGzoTlmhFraQcoJ+RRXnDLcCRlkKilFCRwbw2RhNRSHNc6STMMl7ruHXWuw3ur
         GQLBRP1oP3DVs7rqcmuu+f7cb/CM8tk1wS7qJ3BWeF55S9LfDCB/sInhjWypEaH0pBU7
         z556qGfPPyUpmE9GEKyPkOj827Et8rD4bV/Kg5/wBo8SwDjEjUaYIdwGn+0nE3zMNiMg
         8liTbk1Uuai3LKYHAynZN8KLYZKNynZksbdLFyHJngFig5OjeeBy6kPHXXGAiReKoNr/
         jDZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pDVKmx7C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e42si4119766qta.30.2020.04.17.07.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 07:39:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pDVKmx7C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPS9o-0001sJ-7E
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 10:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jPS9f-0001rJ-E4
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 10:39:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jPS9e-00068y-4S
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 10:39:43 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46963)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jPS9d-00068L-P3
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 10:39:42 -0400
Received: by mail-ot1-x342.google.com with SMTP id w12so1560709otm.13
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2020 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uxlKud17Uh/JE1mXX5DzuYbWjTMgUf6k6sjjaPtZFQA=;
 b=pDVKmx7CzzuK3velurjFZ7qL7BVAltivJG+weNzQqZG6yusty55C08F2PanVZc412V
 4xw8b43K/W5B2ZwmnD/BfSdXw9w/g2XgC9SGMn6omMyvPYrS36mXQUL6zFqb9tFwLFEn
 9EQHYtyWq9MnfqVWAcg/QfbgJ7kt8cx+I1LpwP3w/cUZ5nX9VNNFd5AXw1g1Uo0RQGWx
 5PXUHiznIEhKwgD7f88quS6mcPqy8XP1ZLBitvlgXwBjaxvj2l1vfCj+3tTXweATbNIj
 u4TnZPsM8wjKxla1SEW3wVDl7ock7RxfDWRrUBf6uSUNiM1msFZtHyoFDYBVQttQ2y22
 5qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uxlKud17Uh/JE1mXX5DzuYbWjTMgUf6k6sjjaPtZFQA=;
 b=g+4Z1O0EN4zjPDFJczNg1lFEd9+7281LriT12EbY4XD4VjVUGlQxobBr8C7DvZfH1z
 GF7IVBG+hnNvYAKgCp3fqCabth6d2Ey/I+BQjnYMnr5vAI3miQ5ND1GG6ZsOPBnYQnA+
 mxJ+iSzXXwJmq2vVaO4cVJlyq48Il+bHZ+eLpZFmsv+nOGyqD5iU59NHT5eSkRMeDhUm
 ZI6HuFWDdmAmC6vtqZzen8LBkMVdsGvm59HIanwg0BAGPDXuA5GOd9HNTgrSzY4k8CDc
 /+LGgQKVcJ0zWiTJhbiHxtL1TiSrLi+N03uYaLqVb2W/OTCC/ZALMSWx33w0e0vNRVku
 5gXw==
X-Gm-Message-State: AGi0PuY1ojWmSCTphfNWrcTyGktSTTYzKIDvO9G2pCtyWVcReujFkdzI
 Gu6aw/TslHvkMWH9gKliYnBAKS5aoJHvUIBA+wxcuQ==
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr2837226otb.135.1587134380882; 
 Fri, 17 Apr 2020 07:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200406135251.157596-1-damien.hedde@greensocs.com>
 <20200406135251.157596-2-damien.hedde@greensocs.com>
In-Reply-To: <20200406135251.157596-2-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Apr 2020 15:39:29 +0100
Message-ID: <CAFEAcA8bA_WoNsT8GEO8ivpmywUPr68XWPHSEK5rXw5LS9Hk8A@mail.gmail.com>
Subject: Re: [PATCH v9 1/9] hw/core/clock: introduce clock object
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dvMjNF5zrpV1

On Mon, 6 Apr 2020 at 14:53, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> This object may be used to represent a clock inside a clock tree.
>
> A clock may be connected to another clock so that it receives update,
> through a callback, whenever the source/parent clock is updated.

> --- a/hw/core/trace-events
> +++ b/hw/core/trace-events
> @@ -27,3 +27,10 @@ resettable_phase_exit_begin(void *obj, const char *objtype, unsigned count, int
>  resettable_phase_exit_exec(void *obj, const char *objtype, int has_method) "obj=%p(%s) method=%d"
>  resettable_phase_exit_end(void *obj, const char *objtype, unsigned count) "obj=%p(%s) count=%d"
>  resettable_transitional_function(void *obj, const char *objtype) "obj=%p(%s)"
> +
> +# clock.c
> +clock_set_source(const char *clk, const char *src) "'%s', src='%s'"
> +clock_disconnect(const char *clk) "'%s'"
> +clock_set(const char *clk, unsigned long long old, unsigned long long new) "'%s', ns=%llu->%llu"
> +clock_propagate(const char *clk) "'%s'"
> +clock_update(const char *clk, const char *src, unsigned long long val, int cb) "'%s', src='%s', ns=%llu, cb=%d"

"unsigned long long" isn't a valid type to use in a trace event,
it seems: a build with --enable-trace-backends=dtrace will
produce the following warning:

Warning: /usr/bin/dtrace:hw/core/trace-dtrace.dtrace:54: syntax error near:
probe clock_disconnect

Warning: Proceeding as if --no-pyparsing was given.

Using fixed-width types is preferable anyway; squashing in
this fixes it:

diff --git a/hw/core/trace-events b/hw/core/trace-events
index 39301621ce8..1ac60ede6b7 100644
--- a/hw/core/trace-events
+++ b/hw/core/trace-events
@@ -31,6 +31,6 @@ resettable_transitional_function(void *obj, const
char *objtype) "obj=%p(%s)"
 # clock.c
 clock_set_source(const char *clk, const char *src) "'%s', src='%s'"
 clock_disconnect(const char *clk) "'%s'"
-clock_set(const char *clk, unsigned long long old, unsigned long long
new) "'%s', ns=%llu->%llu"
+clock_set(const char *clk, uint64_t old, uint64_t new) "'%s',
ns=%"PRIu64"->%"PRIu64
 clock_propagate(const char *clk) "'%s'"
-clock_update(const char *clk, const char *src, unsigned long long
val, int cb) "'%s', src='%s', ns=%llu, cb=%d"
+clock_update(const char *clk, const char *src, uint64_t val, int cb)
"'%s', src='%s', ns=%"PRIu64", cb=%d"

thanks
-- PMM
