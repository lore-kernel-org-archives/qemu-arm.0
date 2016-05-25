Received: by 10.25.30.65 with SMTP id e62csp49312lfe;
        Wed, 25 May 2016 10:36:42 -0700 (PDT)
X-Received: by 10.140.38.111 with SMTP id s102mr4697869qgs.32.1464197802648;
        Wed, 25 May 2016 10:36:42 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x22b.google.com (mail-qk0-x22b.google.com. [2607:f8b0:400d:c09::22b])
        by mx.google.com with ESMTPS id f127si8964344qkd.274.2016.05.25.10.36.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 May 2016 10:36:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22b as permitted sender) client-ip=2607:f8b0:400d:c09::22b;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22b as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x22b.google.com with SMTP id y126so39744968qke.1;
        Wed, 25 May 2016 10:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=xiWGv9U6yR0iyxFlnqfpPTqqaKI2fUVtRMhSn80Cag8=;
        b=tE6dPLTwd4pOYryNPwH1qsA6K+CID3ghk/wTESl/1165iXyx9fzYj9zBsMLJd2Ghpf
         KnPzOM7oquoF0xiozBnr9PFiBKpOTpEojBzpb8QAKumy/bv1QGy3K7Np73ruDYHefWjc
         lCOy1CtApIjE7zO381dP95TLhkmusXl1aMqNrqhdZDTZytLix/7GbK9MQpRJiAKksBIF
         5J6pwaDu/5G3c9moZhWukPtdZLL4uZligNU7ZFrBD+ThMPx3Ub1PAM/nb5gqfcEMB67X
         IHkFSV4jFX3PYM0lenpQP2gNxw5U5AmpzfUPJ/Ahsaf8gisK05IHPBvj7+88lj8h19QA
         ZZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=xiWGv9U6yR0iyxFlnqfpPTqqaKI2fUVtRMhSn80Cag8=;
        b=FORI8r3vgUaYM+LnMWI2AqR6Tl8mQudcuDbQuPVrzJfDzWehKZpzHDesKHqHOQ61wZ
         7WONFUcfLeSVeA0y/eW0eBI9JfqLMPF0WXZmFtqtNuzVqV/2AniYtHTSKqHHMfkNVb0V
         tPikgSVuHkDWCLNSVZcH/OmliVeF1GUd3uZKnpMmteJq263CJ9BbiX4BLxeFt1pbfOjn
         YF7XxG4vrcoPGCltvjAxItWWsHn7TYISUpQjFR0UTh//xQzsDpi+LNquCQmZDAg3t8F0
         OrXSiohW56XQ4x01lUNXtxegHl8PpQPKZQ3qifdDLeOEeGc25fgSRSKcYEyh1FHvKxS1
         uqVw==
X-Gm-Message-State: ALyK8tI5KTOykNJpsbvks/UjjalpHi2UyF9Gd85nPp+S9vv41kFrQWLrLrWbt21BtCMwiA==
X-Received: by 10.237.39.161 with SMTP id a30mr4999326qtd.25.1464197802371;
        Wed, 25 May 2016 10:36:42 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net. [71.37.54.227])
        by smtp.googlemail.com with ESMTPSA id m184sm2622586qhm.3.2016.05.25.10.36.41
        (version=TLSv1/SSLv3 cipher=OTHER);
        Wed, 25 May 2016 10:36:42 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC PATCH 3/3] tcg: Add frontend support for fence gen in ARMv7
To: Pranith Kumar <bobby.prani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Sergey Fedorov <serge.fdrv@gmail.com>, "open list:ARM"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20160524171856.1000-1-bobby.prani@gmail.com>
 <20160524171856.1000-4-bobby.prani@gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <8ec7f6ee-24be-2492-17a4-ff95aa35dc89@twiddle.net>
Date: Wed, 25 May 2016 10:36:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160524171856.1000-4-bobby.prani@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: pkIRyKo2pktR

On 05/24/2016 10:18 AM, Pranith Kumar wrote:
> -                /* We don't emulate caches so these are a no-op.  */
> +                if (TCG_TARGET_HAS_fence) {
> +                    tcg_gen_fence();
> +                }

This should then be unconditional.


r~
