Received: by 10.25.0.144 with SMTP id 138csp160089lfa;
        Wed, 26 Apr 2017 00:54:11 -0700 (PDT)
X-Received: by 10.28.137.20 with SMTP id l20mr4384613wmd.6.1493193251527;
        Wed, 26 Apr 2017 00:54:11 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com. [2a00:1450:400c:c09::242])
        by mx.google.com with ESMTPS id h1si780985wrc.138.2017.04.26.00.54.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 00:54:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) client-ip=2a00:1450:400c:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x242.google.com with SMTP id z129so31008438wmb.1;
        Wed, 26 Apr 2017 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Nq9Ds5sjQw2K927bCQTUjnJH1K9yQ8mljaIW6k3xTD0=;
        b=ruYisRg7z+u+YDHHZD2AmvjJqomFcKgIjzNsQsiBi7Z2iPjykk1cMS3V0KbCayBFNx
         wNuVrsFVRQNPmXNrGNCW+xl9du/lM+WY/UkOZ9HqXve6innZ4Vl8YFgqp3GBY49cMSHW
         TN6Df/88ZtAiW4F10rIqavW8QU0WykMSj8+Hg247gPSLkLyu9IkUn4v2MqfW1iH8qLfb
         eyNMuXq32vmQ4NYUg+QCYU5fPltw0yvoYjEcg8md+n+1JNHR4SH/GfnJksyPN9cnAozn
         bkZxQAlh1nNjT5tzlAEnOwzGrosShqMqd9oJpixPHQ03f5xU0TdckrL5NKvZPuTRsgD1
         BmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Nq9Ds5sjQw2K927bCQTUjnJH1K9yQ8mljaIW6k3xTD0=;
        b=Qfi2P5krPhQZjIx9Pr5UFVzmlisK+8ld69rEqH/YOOx5xogUPS0Z1JFYXiwgEwoq03
         XCDjA+D03vMQU8PMmOu4sC5NNmkVgQR8Owdk2znnC3tq2kIlE0CJ6uqQAhIZyaOJXmEB
         g6F+2ee7hjxYfO6eDvPPu/HWpistbYv4S81k99wmMnlnolLjXP99QshZyGL/FeA7il0y
         hlGeq2zwAM4GogwBISXAOedNPgBBl4DSNNGtO0nPHgANgsPfe88/+hV/NPHA9LUQOoWq
         C8ttyQitdEAxfNRaeLiPdZNyqrs55SlntZaME5zMCBaSGpVMEAlJhjuFzX6VWqK7elGQ
         xdOg==
X-Gm-Message-State: AN3rC/73rusvsLJkZw/xmY5Qdd7BRMcYHl4wanazHBlyn3eT/PFHay8n
	wG8oO7kqRow6fg==
X-Received: by 10.28.229.145 with SMTP id c139mr16200851wmh.107.1493193251112;
        Wed, 26 Apr 2017 00:54:11 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id 187sm5990347wmt.16.2017.04.26.00.54.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 00:54:10 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 06/10] target/arm: optimize indirect branches
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
 <1493187803-4510-7-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <9ed31413-ddd8-b229-9731-a0433f8fbcde@twiddle.net>
Date: Wed, 26 Apr 2017 09:54:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493187803-4510-7-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: OhwO2U6hX5BO

On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> +static bool gen_jr;...
>          case DISAS_JUMP:
> +            if (gen_jr) {

Why the variable?  Why not just try the goto_ptr for any DISAS_JUMP?


r~
