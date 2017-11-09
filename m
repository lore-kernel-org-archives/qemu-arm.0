Received: by 10.223.150.237 with SMTP id u100csp2436574wrb;
        Thu, 9 Nov 2017 04:22:00 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbTJzIlLxLiF49YwwCNHWpcbdoMue16zx698Zr/TJD4gnd25SBGCorqMebslUAlAwpOVA4e
X-Received: by 10.202.62.198 with SMTP id l189mr172360oia.281.1510230120534;
        Thu, 09 Nov 2017 04:22:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510230120; cv=none;
        d=google.com; s=arc-20160816;
        b=blNchp5eaHiAHZnZkOJYTS5MLjybKUwSAOIgnUWULVNDzPXlc2izO0q7mwomldsGAp
         ix4FOtxN0syW1OE/ITu6oXB0XLaoWC+pSc0vqmth4OoVL3MDjfGbnwMRS7vI1DAp0nW7
         END8+YKXe3uB0QmUMrH59I4ebYNQpEpWP9qumdhhnvxBDDs9zruLG8vuHsvtnCoQjMBX
         crmpGw9+3jsvD4ItdJqlcuyyWzR0/IzTj1NdK/Iq1cRE5Eda+8Y4TjuBhpKdNqchqtTt
         Zb7gfE20zbpiTUeCiSgq78dn5YGTn8/7dyY9M7sA+0dWEG9g/gCNQQgcwHGRIkaGxD0M
         gnVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=GpwcnaizGGvaMy9/0MYF4aTNyorAStXUwL2o/p74I30=;
        b=vaOYSv7vVB48Xdv0v0WbgMFO58X3ChtC9x1Y7ndTkObdM1dbaGC9I+Cw4XkNDfObT2
         6xWT/9nJWbnmVTxbEeHqnB6/bvnD30kuMfs2r1uJ9Y+tFaYrMEglFb/xF1rxRnb95WKz
         Pf1IIXp0fUPhqiiaoCzbqcLXZ0B3Iura54dqjwazGpFFvxGS/ycKfBwmvZW/0n7AWchk
         s+uf1HhTfqnwieynddZmluCwXy0TEkeiHEr1mKOFpoW8To9xKZfycSTRajT643uDaNwD
         upzMkRf7DJNOHx2ViP6Byo1rrObbqvsjfxQRhR0VDIloLgEF6gDr9ORKGsJF/O6YaSS1
         XoVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id 7si3202586oth.103.2017.11.09.04.22.00;
        Thu, 09 Nov 2017 04:22:00 -0800 (PST)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92F9114;
	Thu,  9 Nov 2017 04:21:59 -0800 (PST)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A71E13F246;
	Thu,  9 Nov 2017 04:21:58 -0800 (PST)
Date: Thu, 9 Nov 2017 12:21:51 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [RISU PATCH 07/10] risugen: add --sve support
Message-ID: <20171109122144.GA22781@e103592.cambridge.arm.com>
References: <20171107150558.22131-1-alex.bennee@linaro.org>
 <20171107150558.22131-8-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171107150558.22131-8-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: yD+I/m5ZkJFo

On Tue, Nov 07, 2017 at 03:05:55PM +0000, Alex Bennée wrote:
> This is similar to the approach used by the FP/simd data in so far as
> we generate a block of random data and then load into it. As there are
> no post-index SVE operations we need to emit an additional incp
> instruction to generate our offset into the array.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  risugen        |  3 +++
>  risugen_arm.pm | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++-------
>  2 files changed, 53 insertions(+), 7 deletions(-)
> 
> diff --git a/risugen b/risugen
> index aba4bb7..0ac8e86 100755
> --- a/risugen
> +++ b/risugen
> @@ -317,6 +317,7 @@ sub main()
>      my $condprob = 0;
>      my $fpscr = 0;
>      my $fp_enabled = 1;
> +    my $sve_enabled = 1;
>      my $big_endian = 0;
>      my ($infile, $outfile);
>  
> @@ -334,6 +335,7 @@ sub main()
>                  },
>                  "be" => sub { $big_endian = 1; },
>                  "no-fp" => sub { $fp_enabled = 0; },
> +                "sve" => sub { $sve_enabled = 1; },
>          ) or return 1;
>      # allow "--pattern re,re" and "--pattern re --pattern re"
>      @pattern_re = split(/,/,join(',',@pattern_re));
> @@ -361,6 +363,7 @@ sub main()
>          'fpscr' => $fpscr,
>          'numinsns' => $numinsns,
>          'fp_enabled' => $fp_enabled,
> +        'sve_enabled' => $sve_enabled,
>          'outfile' => $outfile,
>          'details' => \%insn_details,
>          'keys' => \@insn_keys,
> diff --git a/risugen_arm.pm b/risugen_arm.pm
> index 2f10d58..8d1e1fd 100644
> --- a/risugen_arm.pm
> +++ b/risugen_arm.pm
> @@ -472,9 +472,47 @@ sub write_random_aarch64_fpdata()
>      }
>  }
>  
> -sub write_random_aarch64_regdata($)
> +sub write_random_aarch64_svedata()
>  {
> -    my ($fp_enabled) = @_;
> +    # Load SVE registers
> +    my $align = 16;
> +    my $vl = 16;                             # number of vqs

Would this be better phrased

	my $vq = 16;				# quadwords per vector

> +    my $datalen = (32 * $vl * 16) + $align;
> +
> +    write_pc_adr(0, (3 * 4) + ($align - 1)); # insn 1
> +    write_align_reg(0, $align);              # insn 2
> +    write_jump_fwd($datalen);                # insn 3
> +
> +    # align safety
> +    for (my $i = 0; $i < ($align / 4); $i++) {
> +        # align with nops
> +        insn32(0xd503201f);
> +    };
> +
> +    for (my $rt = 0; $rt <= 31; $rt++) {
> +        for (my $q = 0; $q < $vl; $q++) {
> +            write_random_fpreg_var(4); # quad
> +        }
> +    }
> +
> +    # Reset all the predicate registers to all true
> +    for (my $p = 0; $p < 16; $p++) {
> +        insn32(0x2518e3e0 | $p);
> +    }
> +
> +    # there is no post index load so we do this by hand
> +    write_mov_ri(1, 0);
> +    for (my $rt = 0; $rt <= 31; $rt++) {
> +        # ld1d    z0.d, p0/z, [x0, x1, lsl #3]
> +        insn32(0xa5e14000 | $rt);
> +        # incp    x1, p0.d
> +        insn32(0x25ec8801);

You could avoid this with the unpredicated form LDR (vector).
(LD1x scalar+immediate doesn't provide enough immediate range).

	# ldr	z$rt, [x0, #$rt, mul vl]
	insn32(0x85804000 + $rt + (($rt & 7) << 10) + (($rt & 0x18) << 13));

which is what the kernel does.

No harm in exercising different instructions though!  The kernel uses
embarrassingly few.


Does it matter that the stride will depend on the actual current VL?
If x0 just points to a block of random data, I guess it doesn't matter:
some trailing data remains unused, but that doesn't make the used data
any less random.

[...]

Cheers
---Dave
