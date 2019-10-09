Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp328084wrm;
        Tue, 8 Oct 2019 18:44:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwAcGJ74l//FukdDCHT/E86PZ0OTimJFOaqQ21QVORLW9gPd+7G9ugghrphGN5+sQfWdL20
X-Received: by 2002:a50:e409:: with SMTP id d9mr850945edm.254.1570585477672;
        Tue, 08 Oct 2019 18:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570585477; cv=none;
        d=google.com; s=arc-20160816;
        b=mwTAwP6VfPYKEIGD6w1VrJHwlaYz6MS69KBhK6DuYX5Rd4MhrvS2yfLYKPh1IBvWTv
         s7hQj63iTG8LQu9EJaDZ6YYNuNc/wnaTLVwMDcU3KMhqnpMtRzlvNN4ZuE14IxaP5KOa
         2fJTmQjmaBhLMuJQZ5RVavS6uCX/XeMXVuqJ0AM/BRqojzM/37fZy3UpZHOS9Y9zJ1G4
         76ycrDKBC3Hm3JKmM1yEAKvCS9JgBNHCRY0MZyduQqh7SiZgiILhW27NQNcU3Az+q7Ie
         EYtlXG8tg5umdatExiNRIdRmfo5nAlzfl0IRP5e4VjiLkHUEbi/+LLlFXjz9BHKG6j5W
         GWlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=6s7UxI89Tq3xECMZhOe4OMWISZLQ8DtsnpHEeheVaqQ=;
        b=YbtqjeoRczFAkw0A2FTWXqkW8aSiNAaWsbV5eqpEy1IYDuQzKHyVxkXcKJtEpo8k1D
         kiR9l9zsAO3M1NLPrbYYrRtrHkVzVmy3LjTwv6LW60AtZ1lJUgMukFBvowp5V7/AUarq
         k2IDqX5q5U7FVvASPwJ3yNClpClhkoRU+OCKeEtOq68MQEkms4u0h9d1Lc9w81r/RjuM
         9kRJgTE4g7YZJ+kSwcuiH9uUr98sInNfS9Cc8P3GjZ5wypGytptyzd1vdHrJz4AosD6T
         CtxZBysnB3GyvQraT2oChZPQ7QNQVS1k06aEEebQn+CinDWvYZzGfJgOoFcVlEgll7TK
         1PCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dnvXqCRU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x30si458704edi.351.2019.10.08.18.44.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 18:44:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dnvXqCRU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iI11o-0005dl-Iz
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 21:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI11b-0005dT-DW
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:44:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI11a-0002e6-0g
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:44:23 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:37337)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI11Z-0002b8-PV
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:44:21 -0400
Received: by mail-yb1-xb43.google.com with SMTP id z125so209465ybc.4
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 18:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6s7UxI89Tq3xECMZhOe4OMWISZLQ8DtsnpHEeheVaqQ=;
 b=dnvXqCRUaydcQvMEZFQO5+piK7lURlNNrd1wh+3qQRx0TkjPipIIEEPvbNvuo3SqG1
 gEmZTM3IP7dUCJUhIoWEmZm+/DMTILPrTT+zwLjwXK50zp9HjUrTIvafmdZfPUCHKYI3
 4lfBRR5a6eofLqYsohynAIbECYJ9O6cUN5ebVKVJe7E4goqNIM/kv+ibBX2XYf6X674w
 75SjTDGuZc63l8KXimgXNErRahLecvZD1Ubgg+wplDwheaGsXZw7KKl73TQHOBYiShb1
 5OFEWPOGJhfIoGqbRz2JMw573V8GHv90AxOsV1rWm7h41O1SyYL/c4rwdsOhUxlGlLj7
 Z+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6s7UxI89Tq3xECMZhOe4OMWISZLQ8DtsnpHEeheVaqQ=;
 b=GqDFDqz2u/RVjbnlaA4sgjiQyrN2er1+PGE+qFIG44/4SbGUkeHBzKtf+0OKIawrFS
 PIlRrqtR7zscUbqrMY0Jc3fSrMwiy10/eriqKAG61PF2dRzYpwuURI8qHw52R9hhrDf6
 +ruFaMvur4xahyAja68mLc8UgvC2h61PtF/FYj84eNrh7FOV2kxzUc593Zdd3WO5qL2E
 8E2FJosoqr3792hDxzq5zOe1Js3oTaQiv7u/WrlakBFj8X1spY3Ao2efMG2CWJmObbND
 W9Mk+YVNMjYzxejTuAFjXUpy2y0rFGH7+M+7kNC+F2wmxNwJoZccDv+fOlhqczgYS9mr
 TleQ==
X-Gm-Message-State: APjAAAVLqHxHhMkvlquwANJ9owpjS3Z0/RXK25q1B0WVvq9J7v0FY9LJ
 q8h96T4rYHTiZPoI6AS8AdWVrg==
X-Received: by 2002:a25:ba84:: with SMTP id s4mr464960ybg.79.1570585460807;
 Tue, 08 Oct 2019 18:44:20 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id l24sm216012ywh.108.2019.10.08.18.44.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:44:19 -0700 (PDT)
Subject: Re: [PATCH v2 02/21] ptimer: Provide new transaction-based API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3a24d643-20ba-7328-f643-5a7d6be20ae5@linaro.org>
Date: Tue, 8 Oct 2019 21:44:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sdWLFF+WHoUx

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Provide the new transaction-based API. If a ptimer is created
> using ptimer_init() rather than ptimer_init_with_bh(), then
> instead of providing a QEMUBH, it provides a pointer to the
> callback function directly, and has opted into the transaction
> API. All calls to functions which modify ptimer state:
>  - ptimer_set_period()
>  - ptimer_set_freq()
>  - ptimer_set_limit()
>  - ptimer_set_count()
>  - ptimer_run()
>  - ptimer_stop()
> must be between matched calls to ptimer_transaction_begin()
> and ptimer_transaction_commit(). When ptimer_transaction_commit()
> is called it will evaluate the state of the timer after all the
> changes in the transaction, and call the callback if necessary.
> 
> In the old API the individual update functions generally would
> call ptimer_trigger() immediately, which would schedule the QEMUBH.
> In the new API the update functions will instead defer the
> "set s->next_event and call ptimer_reload()" work to
> ptimer_transaction_commit().
> 
> Because ptimer_trigger() can now immediately call into the
> device code which may then call other ptimer functions that
> update ptimer_state fields, we must be more careful in
> ptimer_reload() not to cache fields from ptimer_state across
> the ptimer_trigger() call. (This was harmless with the QEMUBH
> mechanism as the BH would not be invoked until much later.)
> 
> We use assertions to check that:
>  * the functions modifying ptimer state are not called outside
>    a transaction block
>  * ptimer_transaction_begin() and _commit() calls are paired
>  * the transaction API is not used with a QEMUBH ptimer
> 
> There is some slight repetition of code:
>  * most of the set functions have similar looking "if s->bh
>    call ptimer_reload, otherwise set s->need_reload" code
>  * ptimer_init() and ptimer_init_with_bh() have similar code
> We deliberately don't try to avoid this repetition, because
> it will all be deleted when the QEMUBH version of the API
> is removed.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
