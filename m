Received: by 10.25.0.144 with SMTP id 138csp609396lfa;
        Sat, 15 Apr 2017 04:40:42 -0700 (PDT)
X-Received: by 10.223.175.81 with SMTP id z75mr10786702wrc.11.1492256442225;
        Sat, 15 Apr 2017 04:40:42 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com. [2a00:1450:400c:c0c::243])
        by mx.google.com with ESMTPS id l13si7245771wrb.103.2017.04.15.04.40.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Apr 2017 04:40:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::243 as permitted sender) client-ip=2a00:1450:400c:c0c::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wr0-x243.google.com with SMTP id o21so15079911wrb.3;
        Sat, 15 Apr 2017 04:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=TqcQxVtDekXvU4c/ZH1pJlSz4dlx4ISSAqn6TiQD7fM=;
        b=Z9yIs3B1IVCSEm2R+uqEKyOeWXE8dey4hncAIpWgvmEabGfkbPLZiYuj0D7SHmn0B6
         OjLlTVn7V7nYXULcXUQnAgI+I9mE+cxRLwzdgF76wdDFtq+ANF38daeXMT1CXSM2SjtM
         dMGxTKFIcTLhTI2mgT2bR03L4OUEcU/FVghtGeRWTKpvLV1AX9BxihY/Eej5I27QHQ/S
         C+Gm+iFDvZ1ldLjPyY3qu+yOYjeGkvj0nFxWM4YB2xMwJwZ3B3hZSkIyXtWlT27LBZzF
         b3cG1d48gzDDQGwVBspkVimbCbKwBsThxd8AoS6cHW8PoFZ5DG/+26O8cczjwkU7T33n
         jG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=TqcQxVtDekXvU4c/ZH1pJlSz4dlx4ISSAqn6TiQD7fM=;
        b=pIOvPY0Tx38+k1oK9d2XS3MCtNZZFqPLAxqapqAlAz1pdA2Jt0Mnl2eHOPDeYaQz4G
         tR9dvulMbp0nw0JHCpvM3FeKi3/QultxyetV1kCMKay861lUtSicrvwvrwwdbpnoFNbW
         veyh3w50T+cJJg4DrQAkVCVz6Ur3XXykj/75AJXbjk+H1/YjjyQ5HQHbvHV5fT5lsFIH
         6o+JzeD6DawlorlpxoBNfLev+wDl3FAsdWbvszeVfm+2XkFEq5aqfGgwBA7urp1xubfT
         O5cetIbwhzSNwdmQwfyZnhk2xLnlf5Mkkzj8h64etTEpQKun5G2EuF9XK7JFJnCNwUwT
         d9Lw==
X-Gm-Message-State: AN3rC/5QxPO7xDxigz7L2TU8SJQjUss1p1VEbqxEdYtKxUmXLhcz4fAs
	FLC79IvMTga0cQ==
X-Received: by 10.223.170.143 with SMTP id h15mr11257092wrc.64.1492256441771;
        Sat, 15 Apr 2017 04:40:41 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([87.111.149.139])
        by smtp.googlemail.com with ESMTPSA id 59sm6077857wrl.48.2017.04.15.04.40.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Apr 2017 04:40:40 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 05/10] tcg: add jr opcode
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1491959850-30756-1-git-send-email-cota@braap.org>
 <1491959850-30756-6-git-send-email-cota@braap.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>, Stefan Weil
 <sw@weilnetz.de>, Claudio Fontana <claudio.fontana@huawei.com>,
 Alexander Graf <agraf@suse.de>, alex.bennee@linaro.org, qemu-arm@nongnu.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <73257eb8-edfd-ae0b-a5fa-b1194de568d8@twiddle.net>
Date: Sat, 15 Apr 2017 04:40:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491959850-30756-6-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: wm+tqgsgD8qm

On 04/11/2017 06:17 PM, Emilio G. Cota wrote:
> This will be used by TCG targets to implement a fast path
> for indirect branches.
>
> I only have implemented and tested this on an i386 host, so
> make this opcode optional and mark it as not implemented by
> other TCG backends.

I don't think this is quite the right abstraction.  In particular, if we can 
always return a valid address from the helper, we can eliminate a conditional 
branch.

I think this should work as follows:

(1) tb_ret_addr gets moved into TCGContext so that it's available for other 
code to see.

(2) Have a generic helper

void *HELPER(lookup_tb_ptr)(CPUArchState *env, target_ulong addr)
{
     TranslationBlock *tb = tb_from_jmp_cache(env, addr);
     return tb ? tb->tc_ptr : tcg_ctx.tb_ret_addr;
}

(3) Emit TCG opcodes like

	call t0,lookup_tb_ptr,env,addr
	jmp_tb t0

(4) Emit code for jmp_tb like

	mov	%rax,%rdx	// save target into new register
	xor	%eax,%eax	// set return value a-la exit_tb
	jmp	*%edx		// branch to tb or epilogue.

(5) There needs to be a convenience function in tcg/tcg-op.c.  If the host does 
not support jmp_tb, we should just generate exit_tb like we do now.  There 
should be no ifdefs inside target/*.



r~
