Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp48109nji;
        Tue, 10 Sep 2024 23:12:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmTlJM4qr4g4btnM8hAE7OkOctrgWvCqDsjVfMHzIX30nK8hanEkYwK99r/59Tm0gO9oUKPdPlZTbcog==@linaro.org
X-Received: by 2002:a17:907:2da3:b0:a8d:63b5:e795 with SMTP id a640c23a62f3a-a8ffaadad47mr321973966b.3.1726035149651;
        Tue, 10 Sep 2024 23:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726035149; cv=none;
        d=google.com; s=arc-20160816;
        b=WethUjdaIza0iFxbHEcDlXaQ7wVGvLCV4SJqd9jK1hBtwgTdsoCcc/1JFA03r3IjRt
         N+wN2o8ZCPa6+qITeQWefDbKhG7bZI+UhT0DpB9cN8RLG4pEvha47RHHJkCkPzWgCZWc
         yl0+PD0ZpcIdfiTt6YA61S3scSCUzoI8Wgw075mZFcOL/Wn0MSqpMW44dPtc1uAQsYXd
         7HT++0aPCxFLdwGVbz0DKay55JmK6p89IDhEHa3XPAew7Jk1S9S8y0MRr0jzorDrzQ1W
         xT6WQlxZfaVx/shFJOnoIy6u7tVgWt0cxnhFKM5VwH9iT4W78oHaEOpxvIi5eqSm2009
         Eaxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kAumJrG5geLdw61qf3VpDc77f3fS/zuFfk+876iJiTA=;
        fh=zAJCxTSJNw+hdzplUYpn1gP9LB9qr/rE9Df+BcC5/D8=;
        b=AxPSbKoG+jHgb85raWZkyZMENu1zIHis/8CEEPSTG6V+xPgwlPFbuaWlqJ5FqItRR0
         LcEUQ2cp5iPIEVRuDJ2DAu8+dFQpiHxpPpVyVVDJKKmI/XjdBc5mJ0vP+GqHQUiX3m6F
         l9twbp+at+7W7vBm5uBjUnkQr6DJwORKJ4H205P1nwQa1XJHSWe3BiysyA47hrfLnyu7
         s4BdPN2LcBRBHFzpE8rvKI5VJJTXHd7EU013+Ilx5PEqjwF/CJjvjsj4KItO4tkxEBts
         YEyDDQZh4LfQQ27kwiftOBHgVF681+yEBvWb1guYgQqau7xUVOSocy9ZO0Rjw8ecpuva
         Ixxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=js8EE1rX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a8d24eeb069sor363401166b.6.2024.09.10.23.12.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 23:12:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=js8EE1rX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726035149; x=1726639949; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kAumJrG5geLdw61qf3VpDc77f3fS/zuFfk+876iJiTA=;
        b=js8EE1rX3VwBXTLa4eXOnhz5YHDEJLqx4vOuf7wzbqtgdmaBwEkmrYzZj/jqTHUBZf
         ofQNpqnC4wTBK4M4/WRBpwM8IlZPk+bBnE6Fyd9jkTHgoUPR64fLzEzRTBrtkXG9/liE
         X0oA72AqcJzJBYQoTtjjfBbyUTIsCO/ngwwoyKpdJNgPU99pwiIudSShBmTDzliRFTlV
         AjESHeQBTK5WiQ8/Xl0Af2+qA6qjYgrZKDGsbcpE8culXM1gcYVJNXTH8uAvCFXU4GJ3
         QVdQ5Ja6jTSFkqEN+x8D8Fd0JuBqn7NWHQt7aDLoZGt/tYtFcyrvakyFGUJmMIcZa29t
         U1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726035149; x=1726639949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kAumJrG5geLdw61qf3VpDc77f3fS/zuFfk+876iJiTA=;
        b=gtzNqGLxGmzVd2KPNsmQGsP2L27nUfZdhV8uHksK6no5C70TmxiKBtg2Y4BRTLTsFv
         KU/JX/DI+L1Iv5uGjzN632fObkqzN4ILpRA8VsWT5UGUfydSoLIr4O0K7VUXeDA+0RTQ
         YqhK2vC83uaQlSNTEVrq4iaLwStmv3rIglUhjE4jE1Axi/J3m+VUgrEtq2V+q5H8CZuI
         swe9l31nz/Qje/BX5DqifwgOoM640zfN3S5Kuk0trvtaUhv4ZLwGPJIapXjhw7Qnx3Nt
         ZvPb8z8x0+9UfTas4Xh2ezHDDCJLBiApBmZV+7Xmb2l71fFvghk/5I1MdVZcFO4QrtNF
         bQYw==
X-Forwarded-Encrypted: i=1; AJvYcCWupFdC7gxMcqtwkDVAPkMhvkSeNkSiOXFVV71isW2pzHYRtJcrg4H11qOcdJdw7v14NufPOmln+aMpRg==@linaro.org
X-Gm-Message-State: AOJu0YxxShcX+DaKgrrKyFR9OmMvcCnm7l69h3PbbGR3oXtxZtGqIPPE
	MDNmj/aSYKZFgprrNk44GFlujXV4Yy+8chm6JPpHlXhiyQxn+KxZV4TLgY+Opv+QEg==
X-Google-Smtp-Source: AGHT+IGRY8ki3wghoo/m+frsHDdqzA0RIY8ueJyoMKlmKYbuDtkVoyqaJyXYcUASHJC9DbnG5ihtFg==
X-Received: by 2002:a17:907:9625:b0:a6f:996f:23ea with SMTP id a640c23a62f3a-a8ffb238307mr283396366b.15.1726035149030;
        Tue, 10 Sep 2024 23:12:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.196.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc8csm571366066b.206.2024.09.10.23.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 23:12:28 -0700 (PDT)
Message-ID: <841905bb-105c-4c42-88a9-ecbeefc2ad0f@linaro.org>
Date: Wed, 11 Sep 2024 08:12:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/39] hw/watchdog: replace assert(0) with
 g_assert_not_reached()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, qemu-s390x@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-8-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240910221606.1817478-8-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: SJexcD5h2e4b

On 11/9/24 00:15, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/watchdog/watchdog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
