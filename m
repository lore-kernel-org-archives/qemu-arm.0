Received: by 10.25.44.15 with SMTP id s15csp5186364lfs;
        Tue, 11 Jul 2017 11:16:21 -0700 (PDT)
X-Received: by 10.200.43.58 with SMTP id 55mr1641587qtu.202.1499796980913;
        Tue, 11 Jul 2017 11:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499796980; cv=none;
        d=google.com; s=arc-20160816;
        b=Lu/BI08VOvr1ltNPMPeHOjufTqTGsb7yeB2Fa2eC54pBSPLrjw4aZ+ux/qbJJdvTri
         T56V9iLymeA3teDsAsxHYon8d3Vu+0JPNJsGGRl6FAyDpt7QeOSvijmzwW+7fMvOwadF
         VbT49VvGpyXLv6hNVG7dDNkTfS234O8QTsrR00O+CMJwNM5QTQyOvbWu7HQsHQ5nuW/N
         XlfKUlhYcf6oSG0CmaYo0b5/yiEapwTNvn3jTk8myJMm0tvhtkt5sW0aUWgV8J7DJNeX
         Vw0EJ8BvYikOGOrZGFY2GVKFOaZrpBG2hTG+v1pxRT2TkwM9SGFtlUQybLJva6yNBuIH
         TJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=8UruI4g1IF1u8WZX3T7H9X5cbs7Nnl6jWWa6IemYtBo=;
        b=kqRBiRss8c1SnwIwZIh2YCgYlHTrpivPmgdQE8B/RB0R5PWBsJ6qMz8AuiGgWyPwjE
         2FkTxlDRulh95OMHayHOIHxitl1eO8KVrvSebKIaHbyw4TBUpwrWNrYhfWX9AA2ZKici
         JRaYQtG0MKY+DMFQ92/T5OxGUipqr9M/JFxWPawlX/qWj3VuLZgQo+1dnK0YwzX1rpMb
         DlrAZqbuSw8IS7HKXP0/y0XngpVkBAYaM+Mbv5Zw/pjxi4hA1Et4/PdVTYruzJP48SgK
         7LjcZG0p5CsVXgdTXphODGLs+XMJb2zyLcbnfWhrUy5KaOkqGQHU8oxFD60Tafi9c4Zz
         mvPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=W+oCw+vN;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com. [2607:f8b0:400d:c09::241])
        by mx.google.com with ESMTPS id y187si524615qka.285.2017.07.11.11.16.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 11:16:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) client-ip=2607:f8b0:400d:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=W+oCw+vN;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x241.google.com with SMTP id 16so309qkg.2;
        Tue, 11 Jul 2017 11:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8UruI4g1IF1u8WZX3T7H9X5cbs7Nnl6jWWa6IemYtBo=;
        b=W+oCw+vNBL0G/VuxaQUuf//aTRWKaIFi9EL9MxCMNrNgN0tL46f9iT0JCeuJySQs0+
         HjVlr/4+FX5axAEFy+w7jsD856uHvaQlZ4VEhewJGJvqp3HnmuzWqJbDK3ROtJTvTV/B
         KPB8QAMbK/qtneRA4XquptXI7XyxYYM4677zxXL3gU7t8lvSXq8o6GjzTMPdx63cHVbR
         NqN4On5w+A1Hhnq0n5HAMnRZPX6CNpPTLAi8qMAJzXkKmprTw4gsx2SDj5eA36wnftbj
         A5dxlcJsyynGzRJYdHQIt9jDUTnhY/9ssz+eNbYq/1de3ngj8ibc698AP93PBcP+D9+n
         QcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8UruI4g1IF1u8WZX3T7H9X5cbs7Nnl6jWWa6IemYtBo=;
        b=KlR5z5p3ZUn/ttjQpbUZAUz5tM3dnmcjJw4mS3fHi7ZtKaX4B8ppUuFWK3uqGxAsTv
         KpoYMWMUmQM6r8Ub41u1lLLo8eCt/9mslKDaEOzOPb6PEw7ROGirEzETz14P42JcTLqc
         hzElKd7N6wzROLfTYXhLeMTzAEDq3zlbmSCSkJpE1Xm6stISdMd563J7dvkQ2cYGNmkd
         QFYgeLFgkukSiModaoQtNVsmDSC3JkKG/i4+O2N7JJf0MGaJFLd4tZnr/QiAJrbezKxw
         UF69kL80Id44QO0RzjzBTAp1AA7quda0TxAmYk/KaovKf7qj3hoawz2Ec9GiwobcoOap
         44EA==
X-Gm-Message-State: AIVw110phEIrUrApsxYB55u1n9fZO6Xn+Hi6HqEljRjKOBlwu3fofb7u
	sghKIHer5wh9z4tDZJo=
X-Received: by 10.55.94.70 with SMTP id s67mr1501736qkb.256.1499796980397;
        Tue, 11 Jul 2017 11:16:20 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id y17sm549477qtb.37.2017.07.11.11.16.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 11:16:19 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 4/6] target/arm/translate: ensure gen_goto_tb sets exit
 flags
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, cota@braap.org
Cc: qemu-devel@nongnu.org, "open list:ARM" <qemu-arm@nongnu.org>
References: <20170711175937.23140-1-alex.bennee@linaro.org>
 <20170711175937.23140-5-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <d0d0750b-127e-79e8-4307-57e187cd302f@twiddle.net>
Date: Tue, 11 Jul 2017 08:16:12 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170711175937.23140-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: JW+2qYyFl4+X

On 07/11/2017 07:59 AM, Alex Bennée wrote:
>       if (use_goto_tb(s, dest)) {
>           tcg_gen_goto_tb(n);
>           gen_set_pc_im(s, dest);
>           tcg_gen_exit_tb((uintptr_t)s->tb + n);
> +        s->is_jmp = DISAS_TB_JUMP;
>       } else {
>           gen_set_pc_im(s, dest);
>           gen_goto_ptr();
> +        s->is_jmp = DISAS_JUMP;
>       }

I think DISAS_TB_JUMP is appropriate for both cases.  When not using goto_tb, 
the jump is still static and we still chain to the next TB via goto_ptr.

Otherwise,

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
