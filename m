Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1393502ejb;
        Tue, 19 Mar 2024 09:02:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtga0KcdBCt+0sQgKl3tEf1Gy2CHwAP53WhVM/A2exr3B21ys5FxhhjrMcULHdYRK2biRs9RiB1OpeByWsW6C1MKxlt2Az
X-Google-Smtp-Source: AGHT+IGYa/Qnue4kYymkmq6YpD+hpazUGH+zEkHB7W4zmvQYPcLa9x/YM1YWhTqfXGYo4dROiett
X-Received: by 2002:a5d:44c6:0:b0:341:6aa6:6985 with SMTP id z6-20020a5d44c6000000b003416aa66985mr5231188wrr.65.1710864161123;
        Tue, 19 Mar 2024 09:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710864161; cv=none;
        d=google.com; s=arc-20160816;
        b=dnwHs2uqQfj3C/Zcus6AHOAVpYLBnCfCXzCuiQWfOzOG5xmRx+4KT/kdicfd15dWsl
         l3pl7e6ouYaPzWrIzs0ha+ZRbSYIN096i9d6rPsXm9vRjLv/UEk6Mkmmx9lQAaS4mWVr
         E4JYlnU84kAOI55+NKs7ETR0FvhE3AEnFzrnyK7JvIwIIlMN70k3kXuzl9qZp9ft/tPf
         vf1+LhIS18muMyw2hBf70J0p8gv77HL90tEcFCAoDEFSVAs/NA4nOYXkLXrFt7IgIWKT
         KL7k8AuCUxbBCY44fj4sodnVgWN+bguUZ3Ydl0fp9cWsDexKF+WDcg6OMDc6sxbee8/9
         KyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature
         :dkim-signature:dkim-signature:dkim-signature;
        bh=TamivndfBC9761WbcWGHR42Hb7ojW7ILFJCEWzq+QxI=;
        fh=NvpioLgBtwut+rKD3cjZ8qurUfRv2ftQSwrwZTeMtaI=;
        b=XMx+0PxXajPMg03YxOdLAPBhua6+zlzo7j27Q7y3MwxqH1d7QT6EKze0l9qvoSHL5i
         4DOfbp3Qm0EIux3MjTlhCTEYLIlZiZ7r2Q0uVh08Fuf4JLClWANgMU77BUmoxyMKJw5t
         En9I6+gk4/fUbuI/KR+3lpm5Oat8NxRTL6MH8FV/u5BhiGzSUezQEDNl1EVNGXkAats0
         brLSme4Wwkl+tvWb8C8hUPBFS5B/UQ0AQ4JNfU0sLWFzFkjLdO6082SVZaplJjTykTOR
         e5xwmq6RoetraQQCyweAvmN0we5nAjtAJunSHacMfW5lj9ok7gqeVleXmkBUpeGvRJxu
         uTyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MvhbDmmr;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MvhbDmmr;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15-20020adff20f000000b0033e76f14503si5894659wro.898.2024.03.19.09.02.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 09:02:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MvhbDmmr;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MvhbDmmr;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbuE-00044q-Bn; Tue, 19 Mar 2024 12:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1rmbuA-00042X-CI; Tue, 19 Mar 2024 12:01:35 -0400
Received: from smtp-out2.suse.de ([195.135.223.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1rmbu8-0000MY-2t; Tue, 19 Mar 2024 12:01:33 -0400
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9AD1D5D89F;
 Tue, 19 Mar 2024 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710864078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TamivndfBC9761WbcWGHR42Hb7ojW7ILFJCEWzq+QxI=;
 b=MvhbDmmro8/UnyKevr+IqHEuHQnSu8sZViMszQksgwNuFIxv0iEYie4Ahy7cHKzQS1q6wQ
 oGXFzEGMFKI3mdx1oObEZBJRFSVNY9ZjriK/Eo1ZuMz3eWcRRD3lLHRj7zrgWZYm0tSlj2
 BJtIGy0tlZqLObQpBloF9XV0x24rK4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710864078;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TamivndfBC9761WbcWGHR42Hb7ojW7ILFJCEWzq+QxI=;
 b=c+mMH3uRXacm4srNJ4S5fJVihYKNiIEBPlkuUKQId7v2C8vVmJeod52mIHkWEvp7wu5vhH
 Fy2qfRIt3Ignb9DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710864078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TamivndfBC9761WbcWGHR42Hb7ojW7ILFJCEWzq+QxI=;
 b=MvhbDmmro8/UnyKevr+IqHEuHQnSu8sZViMszQksgwNuFIxv0iEYie4Ahy7cHKzQS1q6wQ
 oGXFzEGMFKI3mdx1oObEZBJRFSVNY9ZjriK/Eo1ZuMz3eWcRRD3lLHRj7zrgWZYm0tSlj2
 BJtIGy0tlZqLObQpBloF9XV0x24rK4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710864078;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TamivndfBC9761WbcWGHR42Hb7ojW7ILFJCEWzq+QxI=;
 b=c+mMH3uRXacm4srNJ4S5fJVihYKNiIEBPlkuUKQId7v2C8vVmJeod52mIHkWEvp7wu5vhH
 Fy2qfRIt3Ignb9DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5DBAC136A5;
 Tue, 19 Mar 2024 16:01:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Km5xFc62+WXxHAAAD6G6ig
 (envelope-from <cfontana@suse.de>); Tue, 19 Mar 2024 16:01:18 +0000
Message-ID: <c756fec0-187f-c117-137b-46341a69fdd8@suse.de>
Date: Tue, 19 Mar 2024 17:01:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH-for-9.1 00/27] accel/tcg: Introduce
 TCGCPUOps::get_cpu_state() handler
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>
References: <20240319154258.71206-1-philmd@linaro.org>
 <b2b9f1f0-bb84-4cbe-828d-6142ebbbbd54@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <b2b9f1f0-bb84-4cbe-828d-6142ebbbbd54@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.74
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.74 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[8];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-1.73)[93.37%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 SUSPICIOUS_RECIPS(1.50)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MvhbDmmr;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=c+mMH3uR
X-Rspamd-Queue-Id: 9AD1D5D89F
Received-SPF: pass client-ip=195.135.223.131; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.417,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: g6WPd6LLf1Lf

Thanks Philippe, I fear I am unable to really be uptodate,
but it's great to see all the cleanup you and others have done!

Ciao,

Claudio

On 3/19/24 16:48, Philippe Mathieu-Daudé wrote:
> (Forgot to Cc Claudio to keep him updated)
> 
> On 19/3/24 16:42, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> This series introduce a generic get_cpu_state() handler in
>> TCGCPUOps and convert each target to it.
>>
>> This is required to get a single cpu_get_tb_cpu_state()
>> for heterogeneous emulation (since this method is called
>> by accel/tcg/).
>>
>> Regards,
>>
>> Phil.
>>
>> Philippe Mathieu-Daudé (27):
>>    accel/tcg: Ensure frontends define restore_state_to_opc handler
>>    accel/tcg: Introduce TCGCPUOps::get_cpu_state() handler
>>    target/alpha: Convert to TCGCPUOps::get_cpu_state()
>>    target/arm: Restrict TCG-specific declarations
>>    target/arm: Convert to TCGCPUOps::get_cpu_state()
>>    target/avr: Convert to TCGCPUOps::get_cpu_state()
>>    target/cris: Convert to TCGCPUOps::get_cpu_state()
>>    target/hexagon: Convert to TCGCPUOps::get_cpu_state()
>>    target/hppa: Convert to TCGCPUOps::get_cpu_state()
>>    target/i386: Convert to TCGCPUOps::get_cpu_state()
>>    target/loongarch: Convert to TCGCPUOps::get_cpu_state()
>>    target/m68k: Convert to TCGCPUOps::get_cpu_state()
>>    target/microblaze: Convert to TCGCPUOps::get_cpu_state()
>>    target/mips: Convert to TCGCPUOps::get_cpu_state()
>>    target/nios2: Convert to TCGCPUOps::get_cpu_state()
>>    target/openrisc: Convert to TCGCPUOps::get_cpu_state()
>>    target/ppc: Indent ppc_tcg_ops[] with 4 spaces
>>    target/ppc: Convert to TCGCPUOps::get_cpu_state()
>>    target/riscv: Convert to TCGCPUOps::get_cpu_state()
>>    target/rx: Convert to TCGCPUOps::get_cpu_state()
>>    target/s390x: Restrict TCG-specific declarations
>>    target/s390x: Convert to TCGCPUOps::get_cpu_state()
>>    target/sh4: Convert to TCGCPUOps::get_cpu_state()
>>    target/sparc: Convert to TCGCPUOps::get_cpu_state()
>>    target/tricore: Convert to TCGCPUOps::get_cpu_state()
>>    target/xtensa: Convert to TCGCPUOps::get_cpu_state()
>>    accel/tcg: Remove check on TARGET_HAS_CPU_GET_TB_CPU_STATE
> 

