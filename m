Received: by 10.25.227.6 with SMTP id a6csp507297lfh;
        Sat, 1 Jul 2017 18:49:02 -0700 (PDT)
X-Received: by 10.55.44.129 with SMTP id s123mr32204343qkh.137.1498960142470;
        Sat, 01 Jul 2017 18:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498960142; cv=none;
        d=google.com; s=arc-20160816;
        b=dyMNyIaww+xaPf73XqrCaYIjthTnRtiyOs4QUcpGCbu5gZnqza9uHas7zfY/tewCun
         C9cXrh8v3tRA2VIY9Ytsk67rLkRQqTtwm5yEzEk6GyCxLC57IW2udwbGoQt8l9iR90Zi
         udDYYJa7EYy1q+5HrBGss4QR7T25aZ5o+0347hhELSzKNZVk70IBSkHDxBou+ybwvP9c
         JObbvIMPtMLlZJK//gGumowkWBpK+smR7mLQTh2B+Q1NlvR6kehSg4SjEL/6ZtG+NWoo
         dbF/COHO39f/NcQcSc0aE9owO1yM+spURCPbU0HgoYvBk9dODgkkBrvmvOIYiMFpK4bD
         d82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=jDukE+G9ZgqvJgd7WYB/A6SW1+rvpD8FnoAILzYE7bY=;
        b=mXp5CSn6kxXPA5Q6WGj6WJHZrwbdktbwqae5a0rRQWjbYGNvArVHLHg9L7lRuoolXK
         04mMgBt+EOCFxeB4VYMqQ5ixGdI0MhbW9fumZeHRMHeVSqFRA9faO0o3j1botOx0EAqZ
         mGiqZgKVCbWxv63DWVRLcc/VPdK5WZYVr3AQJO4wnTkO9ZS9n9WDRjt1C5TImRjhUqy8
         wNuL94jbufjY1EP79P4wUoR4JXLnPROJs8Q9rtVKZiZRNFVgW4VJvO2iJq8RWdhPqUiD
         UtKxkBHcHVOWQ0WUADspGW4zAjZiIl1DDLllPMdPL9CGJYmTTnNIbVti5EeEpVWQulsu
         noiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=vBVGy34b;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id d66si11397055qkf.205.2017.07.01.18.49.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:49:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=vBVGy34b;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id m54so17178241qtb.1;
        Sat, 01 Jul 2017 18:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jDukE+G9ZgqvJgd7WYB/A6SW1+rvpD8FnoAILzYE7bY=;
        b=vBVGy34bHA+KjcM8MRYMpg1vtUR4k2mj2QRlrR3D65BTsWnbcnrD+jqkbHEHw2VC3A
         ZEsM0i8EGtUUWaSDQ8aj6vKEA1LkWxlB35zp8E/zXjbbx87WZ8rbUT1UUZiV6l3ib1cT
         k+LAN4jAG/u2UoNcXqfSwbyoxeILyrJ4S+zIQ2fUhhVydSfk2jVDVMnS6GSztk2ZXkBi
         MeXTtG51o5ZzLOBTmoFkOcvxJ+8ajNZd6xEvgcCGyzHdspMVlPG4KmwtgN4XfEnpYP5Q
         Meg3rrKn8x/2uNWG0Vde12d3CDwlnRg/8bHmlIxAp4X/0YtwUm1d1Gt5S2oiOB5P6BIN
         AIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jDukE+G9ZgqvJgd7WYB/A6SW1+rvpD8FnoAILzYE7bY=;
        b=BY+1irpji00FmTm1mkG7SCN2bz+RojKNGkttdx/HpLxJdyZoHrCJFNZ82IME1M3sJo
         QMxNN84Ne38+XhXc5tdfmTHsxorOLk/jw52VSUlrXjoVzAfKm892xJj6q66WXTfZzxVJ
         NGLVw6JeYGhetRWQXeal7N0aAmKbCCvRtlDcpk8TyUfUmCWiqDL02N+MlTM2etwtQ1RL
         6QVIHfd98pGzL1AyzNr2tNBpAeMbrLCHfftyLCNALOTGvM/5eVV+4fBi4M9ibkSdFKb3
         h0xFsrS5V6Y7zPt3LyjK2Pcouq3lNaIIOz+EbibD+72y3jKImXbjp7IFsdyhvZ+N6p72
         puPQ==
X-Gm-Message-State: AIVw111UNphbUn8MiweMwv6WhOrXisUyrQJIKOGr6sgumVlj1mF9Wm1N
	/+lLEbyv32bOqPghDxA=
X-Received: by 10.200.43.173 with SMTP id m42mr10108263qtm.228.1498960141926;
        Sat, 01 Jul 2017 18:49:01 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id 39sm2282775qtm.26.2017.07.01.18.49.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:49:01 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 26/29] target/arm: [tcg, a64] Port to
 tb_stop
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865849564.17063.5123403029688828196.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <f7e85214-d73c-16bc-8ae5-401f9e04887c@twiddle.net>
Date: Sat, 1 Jul 2017 18:48:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865849564.17063.5123403029688828196.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 6LLxn8g1LSBj

On 06/28/2017 07:01 AM, Lluís Vilanova wrote:
> Incrementally paves the way towards using the generic instruction translation
> loop.
> 
> Signed-off-by: Lluís Vilanova<vilanova@ac.upc.edu>
> ---
>   target/arm/translate-a64.c |  123 +++++++++++++++++++++++---------------------
>   1 file changed, 65 insertions(+), 58 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
