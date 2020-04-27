Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4460801lfm;
        Mon, 27 Apr 2020 11:39:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypIrgu4Yz9iswcwYSFy9cG00jV9JtrvypOfRsij3ZIsdXCobn6kuNVGB1U7i9++Gcze3mTkQ
X-Received: by 2002:ac8:4897:: with SMTP id i23mr24483875qtq.184.1588012767328;
        Mon, 27 Apr 2020 11:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588012767; cv=none;
        d=google.com; s=arc-20160816;
        b=wx512TE31cAUIfJsrs9LB29gqKFEoktnfcAYNzYDlfuVa0wNXjC32gqkwvfURxdok9
         MALecMuunG7iHSC2UED9EyNBOx5Bj69qc/YGPbrdjl4h7H3IB2pDDs++Tdjhy06M7X44
         fyn5wmluWPmFRd/e0M2KgdvHmYYvGKK1uhJnAthfIXtyMzjXFRFi2bAk75uoGHcovW/D
         cHA4F/3OlzIkeD6tkRKUzzLB3gQRL4/t+1wV6lODikKUJDAxwfBV3zcsBJ/jJj2AIOWr
         i8fErxgPFNT5aWoCoIBgNrRS6IyWuCG0ZHTsOZHfp5iPsKQkEJmIgQuXFBeqRiViOYez
         C8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qXO1MV9LQSvXikG2gTD/XNrX1eAS53joYZpOVUCpneg=;
        b=pSLa3rx9SUJ9HlEAlY4soZUDyYo8+zUp+8DtRJfk+TQEYHwYf0jxK1a6I4Ot30JTGT
         4bbGBPIpbThMbosWo6HyuVwJOjK90tGA089ushVf8OQAgpCqw5doCd3fU6r1NBSmk/y/
         g10CDQRfdUNi+M0xOCYe9kfCiJEVIfY0OtU19BfhD890dWHhokjTcSCjK0TASUEm2C0T
         Izmk3koqWHQblJ1LIsOsBqjY5ZBcCi/dAO9ch+DnDx+YsTaP4t1hqcEkEG0WJag9qYJE
         MHDGFSdd346TOmdkjfF2ae/3JV0osMPp4z032xUp0zc5L9HgCPdyBqKvlW+vyzfaMCYu
         pvfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cN3vQqQt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19si8815099qkn.364.2020.04.27.11.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 11:39:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cN3vQqQt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT8f8-000293-MN
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 14:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37926)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT8eu-00028d-Qt
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 14:39:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT8eu-0002UD-5G
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 14:39:12 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:47101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT8et-0002Tt-HS
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 14:39:11 -0400
Received: by mail-ot1-x342.google.com with SMTP id z25so27964215otq.13
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2020 11:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qXO1MV9LQSvXikG2gTD/XNrX1eAS53joYZpOVUCpneg=;
 b=cN3vQqQtEJWKc90RpWVXCMalS3OeBW8EX+lDY+AvtqGM/PpwHzOw+kdsQL+u8ftTR8
 abwNRjaZHno2vFEz0kHR8HxuaqTUryFFDLTRoZyGlWhoeihQuEgp+7O3bE5zK1s9CAm3
 V2lZEztrQt4nlukbwDiWWujP9IgAU0CIzUNARB+24HI2eJlaoQm/g+vnDTtGZ2/hqatr
 pUqJirj0kT0XKfS4xQtE0O6aqL365NEbd1IEkEhlEwSlLwed1V0Scmm5v6wyo84t2HK8
 C6M0rxyyfhCYeNhNfhPC/u3ARASFXFc7KT7mJgX+8YYpasZQtAwNhB0aSJVjRw8h/hhw
 BTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qXO1MV9LQSvXikG2gTD/XNrX1eAS53joYZpOVUCpneg=;
 b=npjdEypd7ld2VnOLyAPPsqQfdVuws8TCpBEbywxlwomqXuHotFrK0K5rKVF3+Ppz4U
 /pJCvkXxh99ZyzKwuqFEQ3m/BVUUMwEWaedL8LA1/z0q9DzoNYzMQ9I3iMQsp+OIL6w8
 DVpD13WYTnryYMO5Kzw1MZTswUFvrNpy92P8ZzekyVLpOpH0tfHGtexMfyp29Tyt1WCS
 LSHTKymtEG2zFJDzGJcAwuYcJg1jlfXuIyFbHLc+KbyrnXlgAWR2m9ycVIX6/eFb0cVb
 Sc0c9rEuqjazF8rXu66YhA40+s1CoBrMmtlEkK+ZAud3ANDiK/9W1h4O8bXrB1wTjxBg
 pzzg==
X-Gm-Message-State: AGi0Puahm9lOEn6SwHZzmcHYkIWXVY2orZg/Izr4tyhNIHYLwseMre/r
 eihr8UYiG6RCw9AKFcI+QGbIhha6+yFRSXDtzZrnzA==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr19045953otj.91.1588012750156; 
 Mon, 27 Apr 2020 11:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200422043309.18430-1-richard.henderson@linaro.org>
 <20200422043309.18430-14-richard.henderson@linaro.org>
 <CAFEAcA8oWP9XGzD+pb_VhDth8zx8j1Gz4vwiK+dArpw8x1BmqA@mail.gmail.com>
 <22c1fd55-7cd3-6320-1f90-40d1bd2cc883@linaro.org>
 <CAFEAcA-iqrEi_wQ+mBN1NtrEKq3uDYPoDunqW5e9KV6ivz3-SQ@mail.gmail.com>
 <d148806b-c7f1-fefc-bfb4-fcefb81ab509@linaro.org>
In-Reply-To: <d148806b-c7f1-fefc-bfb4-fcefb81ab509@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 19:38:58 +0100
Message-ID: <CAFEAcA-iJWqPQ-SwukaBcxgNFppAmeZNUR2doz6sgV6RduC32A@mail.gmail.com>
Subject: Re: [PATCH v3 13/18] target/arm: Update contiguous first-fault and
 no-fault loads
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OtIf+c9TLiP+

On Mon, 27 Apr 2020 at 17:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
> We *can* indicate fault from MemSingleNF for any reason whatsoever, or no
> reason whatsoever.
>
> > // Implementation may suppress NF load for any reason
> > if ConstrainUnpredictableBool(Unpredictable_NONFAULT) then
> >   return (bits(8*size) UNKNOWN, TRUE);
>
> What I'm trying to talk about above, is the third statement in MemSingleNF,
>
> > // Non-fault load from Device memory must not be performed externally
> > if memaddrdesc.memattrs.memtype == MemType_Device then
> >   return (bits(8*size) UNKNOWN, TRUE);
>
> and the reason we can't actually test MemType_Device here.
>
> If you have better wording for that, I'm all ears.  But I don't think there's
> an actual bug here.

Oh, the comment didn't say you were relying on the operation being
allowed to return 'fail' for any reason; in particular the line about
"Normal memory [...] should access the bus" implies the opposite.
(I also missed the distinction here between "indicate fault" and "fault".)

But in that case you have the opposite problem, I think -- just because
something's backed by host memory doesn't mean the guest didn't
map it as Device: that case the architecture says must be indicated
as 'fault' but this code won't do it.

I would suggest something like:

+     * From this point on, all memory operations are MemSingleNF.
+     *
+     * Per the MemSingleNF pseudocode, a no-fault load from Device memory
+     * must not actually hit the bus -- it returns (UNKNOWN, FAULT) instead.
+     *
+     * Unfortuately we do not have access to the memory attributes from the PTE
+     * to tell Device memory from Normal memory. So we make a mostly
+     * correct check, and indicate (UNKNOWN, FAULT) for any MMIO.
+     * This gives the right answer for the common cases of "Normal memory,
+     * backed by host RAM" and "Device memory, backed by MMIO".
+     * The architecture allows us to suppress an NF load and return
+     * (UNKNOWN, FAULT) for any reason), so our behaviour (indicate
+     * fault) for the corner case of "Normal memory, backed by MMIO" is
+     * permitted. The case we get wrong is "Device memory, backed by
+     * host RAM", which we should return (UNKNOWN, FAULT) for but do not.
+     *
+     * Similarly, CPU_BP breakpoints would raise exceptions, and so
+     * return (UNKNOWN, FAULT).  For simplicity, we consider gdb and
+     * architectural breakpoints the same.

assuming my understanding is correct...

thanks
-- PMM
