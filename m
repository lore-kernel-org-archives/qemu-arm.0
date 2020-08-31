Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4004725lfc;
        Mon, 31 Aug 2020 14:14:26 -0700 (PDT)
X-Received: by 2002:a17:902:9a8e:: with SMTP id w14mr2547310plp.6.1598908465917;
        Mon, 31 Aug 2020 14:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598908465; cv=none;
        d=google.com; s=arc-20160816;
        b=qoBT6FUJ58TE7WyGcDQdh3Iq1yAGgJ8pGemXvnQSGNdPd9szQ+cIxhSdxlZyRw88ZC
         0ZcyE8llqSDB3heymYRjy1zW97Zidt+DbkPO3tlnlTSSWtxkY4ZlEDfIUH8P7eose2bm
         ZyfQJ5KT9SiegYMaXln6CS80xbPvXakKjZ7Pa1xdKj627Zq+fJI7tNdGameUMg/THQub
         kuAhYIQ5P+5+7TvNamuEqotEXmYFTUKcWe+gwy05r0z8m6N91aWxx0iVO9FKdoqfI95b
         MUOMEL95wq6zaGHHkK0ZIvTusOR/XxLYtvnngExxmriW02FAzuA/KadkyRFWHwiYWRck
         gj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=22ecnwz+xQW3jC3RmGUWnbBUJnB+yHXpUAC3wkYPOZM=;
        b=e/r7xqAXut16YtDtzIqCjB2sjOFh3A7XLP/M2IjDQzQAMZuWdLw0rJ7vA30dI3uvLp
         fsmxP9JYxTk2xbuQgHktsdhWOl53o4zPk35Ukj8xYTLQ2F2T6Fmr0dj5jRWmklXX6A9v
         1Cm0WtBGaGjobUxwPueVYgM14F8X8wrVV+uCubFy5pzga1T1Pzw/jM7lCVWdeNM3Y55k
         nzWx4HU0XoPTL6Uik3s32TeQ0jZkuvAmY+SS8oXkvI/IjOtV/FcVp46PJhNU2/xCiRhD
         azQj+qQoHlmTfW9h2IXDfttKt2sImv/x8lgoJYC5P3b1PagGTACg9+bU5zh/L4MLn9oT
         8zwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CLNxAAe+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m19sor1092629pgu.50.2020.08.31.14.14.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Aug 2020 14:14:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CLNxAAe+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=22ecnwz+xQW3jC3RmGUWnbBUJnB+yHXpUAC3wkYPOZM=;
        b=CLNxAAe+WaENWsLmNvra+PCKEJZZf6eskpqFY0XUytZPyrwF+gwAoBmmROdwcAwA0V
         K6DRuLe1WLT+w6qRdoAmu9xXNBGEA+/op1R6Q5cQfCMk2jMMvLW/uJaaZvnQG4HHGWHH
         5KBlGPcTzODDiwfvc5hMN6blYqmAhi3mGieoRhSzDILvb2ZxGMo6t9n9lyntTJcPF2hv
         5hUB4KSxIN2+pVXvEIm+3yIEYnHvtM8XnX4JpbksTmOy/mAApJsEuDGPxfYgtI8a4uq/
         aGb0NwFLUC1T2jANlvuz94ZxxPa1Q7rCeVXwDPuTFjGIx2/H4n+w8gfD6WIgME8RqXR1
         bIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=22ecnwz+xQW3jC3RmGUWnbBUJnB+yHXpUAC3wkYPOZM=;
        b=r5tYgK91obG9p6yPE/m84fiKG5Nj7O8v5lEjRFdwBB22lFMKzdUKouq/fue6BTDxC6
         sLMm4koB1PgZPjLgGkZm03ZvuT0sgGjF4mQRf6TF5vvHbs5JBNUhksJxeMmurTOjfKO6
         metZyExaGVBldedKdz9NDZu0Tos8xnbHJ38CCDqgxuyf0qdTDyWrs98M1FyMopkVjD6Q
         OOkiUTiieUMZUlG9X6NTLtkMUAovZ2w/GI72sIYpL2LTfCvVrfpfElP9Wak9Hp+k3fZf
         uj9IBXlJj3YClTy03PQ73nO1VBmRDki0U8FscXVcrhAYE07jUIFbbWr5RNJO3rNsF/7B
         e+Ag==
X-Gm-Message-State: AOAM5325SQJ+fYTnN1RpGv7CBdAhR0Kr4HQljwrirsznkyPu73nRA1aQ
	KQnhbG9y76n8k/f6W4D/jURjIkNd
X-Google-Smtp-Source: ABdhPJxFuPR+29HZdaPJx2lHNbrzWzLlBqAb9kdsGjblmeTNHekGacpovLmbUh/crggwrgUfOdrouQ==
X-Received: by 2002:a63:4923:: with SMTP id w35mr1200787pga.368.1598908465353;
        Mon, 31 Aug 2020 14:14:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id l145sm9590077pfd.45.2020.08.31.14.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2020 14:14:24 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] target: rename all *_do_interupt functions to
 _do_interrupt_locked
To: Robert Foley <robert.foley@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Eduardo Habkost <ehabkost@redhat.com>,
 Marek Vasut <marex@denx.de>, "open list:Overall KVM CPUs"
 <kvm@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "open list:sPAPR" <qemu-ppc@nongnu.org>, Richard Henderson
 <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, pbonzini@redhat.com,
 Stafford Horne <shorne@gmail.com>, alex.bennee@linaro.org,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 peter.puhov@linaro.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20200819182856.4893-1-robert.foley@linaro.org>
 <20200819182856.4893-2-robert.foley@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <45ce8b56-a00d-9504-7eeb-e4cce4efed31@linaro.org>
Date: Mon, 31 Aug 2020 14:14:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819182856.4893-2-robert.foley@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 99ki7LBME1qH

On 8/19/20 11:28 AM, Robert Foley wrote:
> The rename of all *_do_interrupt functions to *_do_interrupt_locked
> is preparation for pushing the BQL lock around these functions
> down into the per-arch implementation of *_do_interrupt.
> In a later patch which pushes down the lock, we will add
> a new *_do_interrupt function which grabs the BQL and calls to
> *_do_interrupt_locked.
> 
> This is the first patch in a series of transitions to move the
> BQL down into the do_interrupt per arch function.  This set of
> transitions is needed to maintain bisectability.
> 
> The purpose of this set of changes is to set the groundwork
> so that an arch could move towards removing
> the BQL from the cpu_handle_interrupt/exception paths.
> 
> This approach was suggested by Paolo Bonzini.
> For reference, here are key posts in the discussion, explaining
> the reasoning/benefits of this approach.
> 
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00784.html
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg01517.html
> https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg08731.html
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00044.html
> 
> Signed-off-by: Robert Foley <robert.foley@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
