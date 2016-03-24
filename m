Received: by 10.25.208.211 with SMTP id h202csp656752lfg;
        Thu, 24 Mar 2016 07:02:41 -0700 (PDT)
X-Received: by 10.112.14.39 with SMTP id m7mr3587571lbc.20.1458828158691;
        Thu, 24 Mar 2016 07:02:38 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lb0-x229.google.com (mail-lb0-x229.google.com. [2a00:1450:4010:c04::229])
        by mx.google.com with ESMTPS id u73si4775392lfd.141.2016.03.24.07.02.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Mar 2016 07:02:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::229 as permitted sender) client-ip=2a00:1450:4010:c04::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::229 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lb0-x229.google.com with SMTP id bc4so31009554lbc.2;
        Thu, 24 Mar 2016 07:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=sTCCC1GSkkLO3vYaZU3eR6WTk+WJi9XqMmE//62K3p4=;
        b=OoUV0J31Xi/hUBizYMrqc6XHIJpx9YQKu8Pj4jU/KrD0PnYWumRifoTrbZma7+fo0d
         8HS7NrdQV4hAisTDb1QCPbCTAzJvXtWF8CmoKlKa5ztUHudMxdxtiLyjCh2QSM4utLL9
         Gu586hoNKroMNYRgJBwv1jb+zLGwUVjbZ76qC4yaSchEkDVWPZe3fWodbHzXOYUyP3H9
         oncvrhzcyd8HpCeuQqdG6c7p25Jt0Y0LX6Qa4elQcMz8yVzYLQRmPEAQOC66Z7avfpWI
         TP2Qad4n+ry9s+3mMWhRrFWR2VFI3Hk1bKGs2xX/4CHKN9e3r7tnFwBiV6Y6K90JY9F2
         ZqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=sTCCC1GSkkLO3vYaZU3eR6WTk+WJi9XqMmE//62K3p4=;
        b=P14+/SjmqeZ1p9Kn2nqHzrvBXFbNnESUz5mWQ9wDGSwzGDvcsFao5u3DeytGqGFNFl
         CcEwMvRr3e13mACmw1NL0FiM2wxEwxO5FISUgqi6DkltPDfoQOVv2PClueGm3c2p7z6R
         Kte/6HpVYsnci37w8k29Ot1vE/XUetzQFYAWhWIsGVs7t6iFIjFdLnxX54SAqj1LCL4g
         UUsBy3v8GDhDSDghdA+9Zyys+20aEmeZuY7L6hnlM0N7gFAEHsh0Kum31Hz/o/ysd9V3
         5I0yBBJW9SKS6yWcCAb/+Dtr308pX0b2VwNKyUjgKRDZy24wWNT6KY/+K/ZmkZVuOFRW
         nw0g==
X-Gm-Message-State: AD7BkJJCcGoRiOa17gXAHz+oiRrVXwgwUukr1vJwbvEmCgeMmVNvuNkVobKZj8x8W9JazQ==
X-Received: by 10.112.201.133 with SMTP id ka5mr3536579lbc.1.1458828158223;
        Thu, 24 Mar 2016 07:02:38 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.0.56] ([195.91.132.170])
        by smtp.gmail.com with ESMTPSA id rx1sm1190081lbb.22.2016.03.24.07.02.33
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 24 Mar 2016 07:02:37 -0700 (PDT)
Subject: Re: [PATCH 1/8] tcg: Clean up direct block chaining data fields
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 sergey.fedorov@linaro.org
References: <1458815961-31979-1-git-send-email-sergey.fedorov@linaro.org>
 <1458815961-31979-2-git-send-email-sergey.fedorov@linaro.org>
 <87poukq9fk.fsf@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, "Vassili Karpov (malc)" <av1474@comtv.ru>,
 Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56F3F377.4070809@gmail.com>
Date: Thu, 24 Mar 2016 17:02:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <87poukq9fk.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: zIreU6BtquGI

On 24/03/16 16:42, Alex Bennée wrote:
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> > index 05a151da4a54..cc3d2ca25917 100644
>> > --- a/include/exec/exec-all.h
>> > +++ b/include/exec/exec-all.h
>> > @@ -257,20 +257,32 @@ struct TranslationBlock {
>> >      struct TranslationBlock *page_next[2];
>> >      tb_page_addr_t page_addr[2];
>> >
>> > -    /* the following data are used to directly call another TB from
>> > -       the code of this one. */
>> > -    uint16_t tb_next_offset[2]; /* offset of original jump target */
>> > +    /* The following data are used to directly call another TB from
>> > +     * the code of this one. This can be done either by emitting direct or
>> > +     * indirect native jump instructions. These jumps are reset so that the TB
>> > +     * just continue its execution. The TB can be linked to another one by
>> > +     * setting one of the jump targets (or patching the jump instruction). Only
>> > +     * two of such jumps are supported.
>> > +     */
>> > +    uint16_t jmp_reset_offset[2]; /* offset of original jump target */
>> > +#define TB_JMP_RESET_OFFSET_INVALID 0xffff /* indicates no jump generated */
>> >  #ifdef USE_DIRECT_JUMP
>> > -    uint16_t tb_jmp_offset[2]; /* offset of jump instruction */
>> > +    uint16_t jmp_insn_offset[2]; /* offset of native jump instruction */
>> >  #else
>> > -    uintptr_t tb_next[2]; /* address of jump generated code */
>> > +    uintptr_t jmp_target_addr[2]; /* target address for indirect jump */
>> >  #endif
>> > -    /* list of TBs jumping to this one. This is a circular list using
>> > -       the two least significant bits of the pointers to tell what is
>> > -       the next pointer: 0 = jmp_next[0], 1 = jmp_next[1], 2 =
>> > -       jmp_first */
>> > -    struct TranslationBlock *jmp_next[2];
>> > -    struct TranslationBlock *jmp_first;
>> > +    /* Each TB has an assosiated circular list of TBs jumping to this one.
>> > +     * jmp_list_first points to the first TB jumping to this one.
>> > +     * jmp_list_next is used to point to the next TB in a list.
>> > +     * Since each TB can have two jumps, it can participate in two lists.
>> > +     * The two least significant bits of a pointer are used to choose which
>> > +     * data field holds a pointer to the next TB:
>> > +     * 0 => jmp_list_next[0], 1 => jmp_list_next[1], 2 => jmp_list_first.
>> > +     * In other words, 0/1 tells which jump is used in the pointed TB,
>> > +     * and 2 means that this is a pointer back to the target TB of this list.
>> > +     */
>> > +    struct TranslationBlock *jmp_list_next[2];
>> > +    struct TranslationBlock *jmp_list_first;
> OK I found that tricky to follow. Where does the value of the pointer
> come from that sets these bottom bits? The TB jumping to this TB sets it?

Yeah, that's not easy to describe. Initially, we set:

    tb->jmp_list_first = tb | 2

That makes an empty list: jmp_list_first just points to the this TB and
the low bits are 2.

After that we can add a TB to the list in tb_add_jump():

    tb->jmp_list_next[n] = tb_next->jmp_list_first;
    tb_next->jmp_list_first = tb | n;

where 'tb' is going to jump to 'tb_next', 'n' (can be 0 or 1) is an
index of jump target of 'tb'.

(I simplified the code here)

Any ideas how to make it more clear in the comment?

Kind regards,
Sergey
