Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2662445ejb;
        Wed, 4 Oct 2023 06:42:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqpw919G0Wl0Kw0iCVcxZ8sc8wQ5sHMI8pn9FIBZR1fgZzkXFW0Anlmlq8dxtBm9pWvuXh
X-Received: by 2002:a0c:f24f:0:b0:65b:12b1:d54f with SMTP id z15-20020a0cf24f000000b0065b12b1d54fmr2776532qvl.22.1696426942873;
        Wed, 04 Oct 2023 06:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696426942; cv=none;
        d=google.com; s=arc-20160816;
        b=I2xAQ8+XEc1YAh/X5Bt9ok/40K8KZj9njzgiaOennh4AsNkcAwC+gO344jE1gv7QjF
         4wz6xejqadKgxeNR7reK/fQ9+cYMCOlMYaTMiR8P0gqVEtLPetUplYqSoo5kVnAxPozv
         DGBsI6cztFWE+ndNltkV+qMwfqwNMd1gKJyFL74BQg3BBeps3LYXkxIAVhyT9GvXOBzz
         ea0NW8mLI6crqw4MeAtzNvMuKEU5mdXeIUR3SjvsdCNx2LQyVQBoVjBSOLKt0v/KtwRN
         QQ4lnLPCT/j+iBJjCZ7ix2+RsjEdv1BkuadUwqdnuHOAuQ3gT6W+N7twlFD1wAJGPvx1
         Wqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature
         :dkim-signature;
        bh=oRHGFsWWsaMiT4za2Ha7olylZlczXbGP/cTLlISMQZw=;
        fh=m4WEECK7ITjHmOx/2xz74im+4FZ/7vOEfEPLJEeFBLQ=;
        b=tTQ0slHw8LLBIPFznGGyWDn074I+9wkj5Ulv7uwS3ptRiY3n7h3SJbL6PHVETlYYeM
         MVjrN9B4qnbH0SKhTyRtDOaJiVeTpcHzcxbyAyd2rUR7Ecud2BiOumN8tIZ/ktOhp6XT
         ArGIB19JnncSzg+buME+61AcAw1K0qnAL65T0wCHadNawjVdeLOOwBFhf6RzW9fQBKTk
         unuGcLbb+31nTzR4iqnxIc866rcyPgzIw0qt6lRB3Iv/IPmc9O8gFTfxErJvBfYsGFLy
         w//9BC6lh6iLIWKkuPtd+CmNubqCUWzJW4eAJ4vyGazpDbb9OLWxgncdoUOU4wrIXXMW
         HgdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=BVRh0+8P;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020a0cde07000000b00655e4826736si1466429qvk.69.2023.10.04.06.42.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 06:42:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=BVRh0+8P;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qo289-0007Cq-RH; Wed, 04 Oct 2023 09:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1qo287-0007B7-Sh; Wed, 04 Oct 2023 09:41:35 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1qo286-00079S-8B; Wed, 04 Oct 2023 09:41:35 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B3A4E2184D;
 Wed,  4 Oct 2023 13:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696426889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRHGFsWWsaMiT4za2Ha7olylZlczXbGP/cTLlISMQZw=;
 b=BVRh0+8PS/DzVfI6XvSrS4NzPDkbAeYqH5BwoKH6dPpV/exxG38RV48fBqJ0I83nBoHyJb
 I5/x7tYpW+1eZRIlcpwo4tYt2hlpQgL1qCVtzLJrNxMvcox51VAYfEPoxd6EMuVG0FC2us
 RwQl/oPFlSzE80663kq2rlQg4aLMf3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696426889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRHGFsWWsaMiT4za2Ha7olylZlczXbGP/cTLlISMQZw=;
 b=E+t5OJRN/YVcrUUHu0TAdojbDPrvz/3Y+A4PgmpLTlBjOtzGo1R1I+gjN5cnXMDLcd+/Df
 G+BdarjhPQ4yU8DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 63D29139F9;
 Wed,  4 Oct 2023 13:41:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RD6BFolrHWWwXgAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 04 Oct 2023 13:41:29 +0000
Message-ID: <00b2ec16-162e-9204-3a04-f45e0edeeb15@suse.de>
Date: Wed, 4 Oct 2023 15:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231004090629.37473-1-philmd@linaro.org>
 <ZR1bjpEi5HdFp2xj@redhat.com>
 <85be2979-c0ca-3eb4-dae9-bbabf256c201@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <85be2979-c0ca-3eb4-dae9-bbabf256c201@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.528,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KuFR8lhwwkRB

On 10/4/23 14:37, Thomas Huth wrote:
> On 04/10/2023 14.33, Daniel P. Berrangé wrote:
>> On Wed, Oct 04, 2023 at 11:06:15AM +0200, Philippe Mathieu-Daudé wrote:
>>> This series finishes the cleanup which remove the confusion
>>> of using 'softmmu' when we really mean 'system emulation',
>>> as opposition to 'user emulation'.
>>
>> Am I mis-understanding what you mean by 'finishes' here, as
>> I see many references to softmmu remaining
>>
>>    $ git grep softmmu | wc -l
>>    270
>>
>> In particular under configs/
>>
>> I was also hoping it meant that we'd be changing configure
>> to allow
>>
>>      configure --target-list=x86_64-system
>>
>> though the lazy side of me would like
>>
>>      configure --target-list=x86_64-vm
>>
>> for less typing
> 
> Maybe we should also bikeshed about the naming first... "system" is a quite 
> overloaded word in this context already, and "vm" sounds rather like 
> hardware-accelerated stuff ... what about using something like "sysemu"? Or 
> "fullsys" for "full system emulation" (in contrast to "user space"-only 
> emulation)?
> 
>   Thomas
> 
> 

Just my 2c, to me "system" is the only word that makes sense here, even from a purely user perspective.

We already have exposed "system" to the user as a way to mean this, as in:

./configure --enable-system
./configure --disable-system

and if everything is renamed from softmmu to system where it makes sense in the code,
it's the best option for development as well in my view.

Thanks,

Claudio


