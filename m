Received: by 10.25.0.144 with SMTP id 138csp1809315lfa;
        Tue, 25 Apr 2017 04:01:51 -0700 (PDT)
X-Received: by 10.223.171.26 with SMTP id q26mr2542833wrc.15.1493118111466;
        Tue, 25 Apr 2017 04:01:51 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com. [2a00:1450:400c:c09::241])
        by mx.google.com with ESMTPS id g14si18367376wra.249.2017.04.25.04.01.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:01:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::241 as permitted sender) client-ip=2a00:1450:400c:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x241.google.com with SMTP id y10so13004503wmh.0;
        Tue, 25 Apr 2017 04:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=awjhlxSivS0lHcmjcQEMD+vd836NariaeNYjs1vObqo=;
        b=Ty03f08YEmvXRd2jDZBu8Ncso3fzO0AbluxiaKtrp9vcUX4NtKG1KofZZJQjbk/lM6
         gVdnn/GJ+YHQxvl/qXreQ5FdY4N23xwGqSqUc2mRDDmEwYerHR4bt2wtsGZIxsf1qBc3
         2nI3bnf69q9DJFqTWkJ3CR7zEH4yLd4aye7Tv77LF+jPpocrassMTOo8NzUwp4FKm7wX
         1suxJifcRqclpL4DZU3D1Coyzhq4dKPQOrj68MNxRzpUJE3MqTh6J9XpqWudpFjwvTtZ
         Yku0/FMkugNgv8B60NLkXTkl46o0sNTzM6LHwlA81IKyu5v3B+OG5sllqVoAcD+RX1Ux
         KU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=awjhlxSivS0lHcmjcQEMD+vd836NariaeNYjs1vObqo=;
        b=Oj4Fqy5AwYkJ7AvAfxXMkj8bkZRKAPQGDY+9XQe+G+SJUxtgPSV3/StYEbdF35A+7f
         taw9cM0gg+NWUXZG0UfxxNCMi6Gu4buvdW+Vgg3OawIisnLCTz3bqMRnRFgZaxdnWD6K
         8U/2/jucnk8aeSqXcSdIt+WHi5p5kBBkYt0yZVY/9a33D38sCam5eoc85jr/DVMry1+x
         eomxgqPncXvzB5zuoYA7IvE1pjGYt8ySn1WohkPT3HBBHIDNAHHdVJb2QuzoqDy9wzIt
         SlA6a+KX7OQD7f9FiMgW/cwDDgq3rv1N6enNNm9kqokDAN0aePhj99Cqu3fwZN7TP9jA
         X7bg==
X-Gm-Message-State: AN3rC/5n7LieqDTNO1O7dTaLVy6Em4dZZ1yyq3ErqiUF3HXhZ0VWJbU/
	HI9/O9HyNX1kcg==
X-Received: by 10.80.171.230 with SMTP id u93mr4708508edc.130.1493118111201;
        Tue, 25 Apr 2017 04:01:51 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id b5sm4942071edf.69.2017.04.25.04.01.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:01:50 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 03/13] tcg: enforce 64-byte alignment of TCGContext
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
 <1493106839-10438-4-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <4867e64c-c26d-f71b-2708-c2a3163c20d1@twiddle.net>
Date: Tue, 25 Apr 2017 13:01:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493106839-10438-4-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: aHqwd+66QdNH

On 04/25/2017 09:53 AM, Emilio G. Cota wrote:
> This will allow us to prevent cache line false sharing in TCGContext.
> 
> Before:
> $ objdump -t  build/x86_64-linux-user/qemu-x86_64 | grep tcg_ctx
> 00000000003ea820 g     O .bss   00000000000152d8              tcg_ctx
> 
> After:
> $ objdump -t  build/x86_64-linux-user/qemu-x86_64 | grep tcg_ctx
> 00000000003ea880 g     O .bss   0000000000015300              tcg_ctx
> 
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>   tcg/tcg.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/tcg.h b/tcg/tcg.h
> index 6c216bb..5fdbfe3 100644
> --- a/tcg/tcg.h
> +++ b/tcg/tcg.h
> @@ -727,7 +727,7 @@ struct TCGContext {
>   
>       uint16_t gen_insn_end_off[TCG_MAX_INSNS];
>       target_ulong gen_insn_data[TCG_MAX_INSNS][TARGET_INSN_START_WORDS];
> -};
> +} QEMU_ALIGNED(64);

Let's drop the alignment and structure re-arrangement for now and focus on the 
task of goto_ptr.


r~
