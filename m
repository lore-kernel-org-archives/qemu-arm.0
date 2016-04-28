Received: by 10.25.208.137 with SMTP id h131csp420513lfg;
        Thu, 28 Apr 2016 11:03:53 -0700 (PDT)
X-Received: by 10.140.229.69 with SMTP id z66mr15670862qhb.48.1461866633804;
        Thu, 28 Apr 2016 11:03:53 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-qg0-x241.google.com (mail-qg0-x241.google.com. [2607:f8b0:400d:c04::241])
        by mx.google.com with ESMTPS id 201si5481379qkd.41.2016.04.28.11.03.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Apr 2016 11:03:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c04::241 as permitted sender) client-ip=2607:f8b0:400d:c04::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c04::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qg0-x241.google.com with SMTP id d90so6072888qgd.1;
        Thu, 28 Apr 2016 11:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=X2CFKV57udPo8eFkHABUi8EJnDNDKI/tPVrY5rJyiTQ=;
        b=FOSwmQx1Vo7qXicpRF1PzSql+iAmJXkXM/i9xYFF6W0uAz8DWYD/ODTU+0PgLo+rGy
         5hiX7I5GaZMIJxLOaOELO4hNvAzWyFB22r2NERlbVB6kzYrXQt2R1tF8E/gNNy/AvTvj
         ZlmZt6rkxgh5hcqEASxODDabk7Dmum3FGjqiIm1s4bKwcF2BFySbScCUga1mpJDxgrZp
         AH9kQQoISp1NF/i++Xb0pAubfrdt579HuUGEG7Y4eq31Hd6eqZ3GYyuPR1lUNTqywvVi
         Cq8REqvGbXNvv2MBn0krs84dYPPcGyP/yEe2Je8FCb45Zs+4HaoZ9r0YkjMsjnwQI0U/
         LCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=X2CFKV57udPo8eFkHABUi8EJnDNDKI/tPVrY5rJyiTQ=;
        b=QCFhKJiv366KCEa0CkWjKXrnZ/AGsJnC2qqy/jw6snfq4OU+1Yvk1NrE0JOU6RKqRg
         N6on+s/YHZkDBC6RWIUZxZoBd4PCCN+uG4KnzD6l66J8LD4EP1jvhP4/LIw4ONHeX61y
         B5LjrDSkmxmSi+7N5jjjJYkM+mmuHfVyokigllf9+ZY0vbYlNc4NmwUGa9nge3agM+v5
         GfAxYQOpI/0AhYDxoEItjFp6rZPdPrRJMDlkhgsa78cK15nuH0xC9gsWzyCsW0DQb+8/
         M0TK+wmr03HHltSidBsh/f7M0cnBOZJ6fWYxQuJf7074HpNPAhtG9eQ/Ln+WHk0RuStd
         vnSw==
X-Gm-Message-State: AOPr4FX2SNYVKpxygQfvqs/Lrd2tT6Il2v0F4o/kf8lAKiFbHDa71tgevloQFscpYH9nIA==
X-Received: by 10.140.203.72 with SMTP id y69mr15755378qha.79.1461866633486;
        Thu, 28 Apr 2016 11:03:53 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from anchor.twiddle.net (50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
        by smtp.googlemail.com with ESMTPSA id z66sm3169533qhc.16.2016.04.28.11.03.50
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 28 Apr 2016 11:03:52 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v4 10/10] tcg: Allow goto_tb to any target PC
 in user mode
To: Sergey Fedorov <sergey.fedorov@linaro.org>, qemu-devel@nongnu.org
References: <1461186921-14977-1-git-send-email-sergey.fedorov@linaro.org>
 <1461186921-14977-11-git-send-email-sergey.fedorov@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Jia Liu <proljc@gmail.com>,
 Alexander Graf <agraf@suse.de>, Leon Alrae <leon.alrae@imgtec.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-arm@nongnu.org, Sergey Fedorov <serge.fdrv@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <830a4c91-8109-f9be-f32e-b2be4ac23c69@twiddle.net>
Date: Thu, 28 Apr 2016 11:03:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <1461186921-14977-11-git-send-email-sergey.fedorov@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: 5r8myEdtcAsd

On 04/20/2016 02:15 PM, Sergey Fedorov wrote:
> --- a/target-alpha/translate.c
> +++ b/target-alpha/translate.c
> @@ -464,8 +464,12 @@ static bool use_goto_tb(DisasContext *ctx, uint64_t dest)
>      if (in_superpage(ctx, dest)) {
>          return true;
>      }
> +#ifndef CONFIG_USER_ONLY
>      /* Check for the dest on the same page as the start of the TB.  */
>      return ((ctx->tb->pc ^ dest) & TARGET_PAGE_MASK) == 0;
> +#else
> +    return true;
> +#endif
>  }
>  

Nit: The in_superpage test just above is for kernel mode and need not be tested
in user-only.


r~
