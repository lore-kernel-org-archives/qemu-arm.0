Received: by 10.25.159.19 with SMTP id i19csp2607836lfe;
        Tue, 19 Jan 2016 08:56:36 -0800 (PST)
X-Received: by 10.202.173.9 with SMTP id w9mr23079357oie.79.1453222595967;
        Tue, 19 Jan 2016 08:56:35 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-ob0-x243.google.com (mail-ob0-x243.google.com. [2607:f8b0:4003:c01::243])
        by mx.google.com with ESMTPS id d7si896263oby.86.2016.01.19.08.56.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2016 08:56:35 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::243 as permitted sender) client-ip=2607:f8b0:4003:c01::243;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::243 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-ob0-x243.google.com with SMTP id oj9so18692980obc.0;
        Tue, 19 Jan 2016 08:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=KKGArgyPQlUpF0LNZj5vfnrhZFNknWsWPYOJ7qoprDY=;
        b=ouG6UTbEn82AVCgF/xXhj//MaC8Vdk2Ahec0c0sxwcbEthyU+B4tTU3Fe4dkpCVggg
         MqY/toAsv+Fyl/ZCMy+HlpS7dQvRb3a6r9PTR/ZFCPWk26es6CZWkPvki3oJPedfUjEo
         sG55F3Qpt9jbkgCbkiKhd90uAoj8TguSMQ6peeRL51AkZ4BxCZAaT6DD4cGKdxLH0jET
         tHHs5hg7O5cd4rdv261euK4vOnCZUWTSbe0fgu1n+E1NyTEG4SXe7vPmUp3X0UFDW77n
         P0dHRcDImPWLlINbbOagBlgBZvWN3+/ZQ26gEtW0epYvB/evcgO9I304HV6hTWYIr9YZ
         ivpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=KKGArgyPQlUpF0LNZj5vfnrhZFNknWsWPYOJ7qoprDY=;
        b=IP8zPJ5JsMuqQB33/wyEUBOotzunRLH+4aBmQN2qsaME0xR12shWePmxIW3y0kdKhq
         2dIQCec5KsvtGuEGyyGBOC01imPUjzyHMSTViotKeEaZZZGTMzKdKTSx9MsOh1e4q+pv
         56dx9aNf3tsWL36U7KZxjL79E+UtPschIekFznOoTvmWNfVa+Pftgg1Q2gZvThrbQ+93
         tZ7YkS4eC9mQPadfgTDcpWYy8bQ3vN5AikplL3RJX3MqknI8RnsoBXd7MpvfaQruYbqM
         uoQZvvH7uecTMKVkvKj3Z33SLG3zSJuAeZk01mQsJX1hCIVwJwTI2Ok1NNkCFxFVt8Bs
         k4Sg==
X-Gm-Message-State: ALoCoQl8zKiZ93vXcXXINpu+CKrd35et5JNBIXz0HnmGQlZ/wBiFyxSMGzyW4ohahqZrNgQHSZO+SlLe6kx62ebpDUOcmYLgDw==
X-Received: by 10.182.28.162 with SMTP id c2mr24136193obh.76.1453222595613;
        Tue, 19 Jan 2016 08:56:35 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id sd7sm15481593oec.13.2016.01.19.08.56.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 08:56:35 -0800 (PST)
Date: Tue, 19 Jan 2016 17:56:31 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 8/8] target-arm: ignore ELR_ELx[1] for exception return
 to 32-bit ARM mode
Message-ID: <20160119165631.GR29396@toto>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-9-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452796451-2946-9-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: skjAh+nu+V27

On Thu, Jan 14, 2016 at 06:34:11PM +0000, Peter Maydell wrote:
> The architecture requires that for an exception return to AArch32 the
> low bits of ELR_ELx are ignored when the PC is set from them:
>  * if returning to Thumb mode, ignore ELR_ELx[0]
>  * if returning to ARM mode, ignore ELR_ELx[1:0]
> 
> We were only squashing bit 0; also squash bit 1 if the SPSR T bit
> indicates this is a return to ARM code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
>  target-arm/op_helper.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 5789ccb..171d6b8 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -738,7 +738,11 @@ void HELPER(exception_return)(CPUARMState *env)
>          }
>          aarch64_sync_64_to_32(env);
>  
> -        env->regs[15] = env->elr_el[cur_el] & ~0x1;
> +        if (spsr & CPSR_T) {
> +            env->regs[15] = env->elr_el[cur_el] & ~0x1;
> +        } else {
> +            env->regs[15] = env->elr_el[cur_el] & ~0x3;
> +        }
>      } else {
>          env->aarch64 = 1;
>          pstate_write(env, spsr);
> -- 
> 1.9.1
> 
