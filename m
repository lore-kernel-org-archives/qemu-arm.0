Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp48007nji;
        Tue, 10 Sep 2024 23:12:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV94/7j0WU6WgbY7u2iABJb6zh5wUP6OccUF6BMcZV4qCfQxpvh3UnzBKF7Enl9rKTWNksPEqegRcgNWA==@linaro.org
X-Received: by 2002:a17:906:d7e1:b0:a8a:8d81:97b1 with SMTP id a640c23a62f3a-a9004896e2amr194925766b.27.1726035121340;
        Tue, 10 Sep 2024 23:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726035121; cv=none;
        d=google.com; s=arc-20160816;
        b=eIMnYQkz0qoK5D771BScbmfRxD1kniMjDb7qcuuXx533cVAgT9Y9YZJaxLPHgvfyoJ
         qYNRyOqwOP4b8pqN3BMdZnCkzzD5NI+sF2e0ufQfDXNgMro6Ejodn5xkbOjEF9SPh7cO
         tO2wcJXhAAPyOcZ8nhuqrj/YcPqb1ce47WuoOJURelmH+2ZXHDkP6Dnn4mhRHBnaBFab
         18oR9S6jyKPAqWeX8VbaUSfWh1Ak94dYqBsy1qLhibbXHyVg+wxlSnrRIGurZArWcTRt
         kj2wewod1p35uVpZNEqWxk06cKFNVH2sAGWkwyv1egUvNNsPTp8ileOh3caIUPkT1qcx
         GMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+34vrWrHaGMzGum0dUZAL9TUKidQHtpHEuGMkrYa2DA=;
        fh=6UZ4SQg9uXwGq8KV7cnOTMJ/xNVFT5lqfgD60sik2pE=;
        b=NOICq14YoYXv65DyIrmSjPkXQRHhEV1JjQHdF9n6KmIEyGS7r/ZZSQ5xTihYai45cg
         TIsRp2Ip8sJxAcHaeOvpH0cfc9zMckbpCqUvqZq9071M8PJsmYMQZfEo9on+FyDtJJGF
         mopGtMVT140N74D1A/0rKWr7TIm8ylKD5tS++tLisrPQ8zd+Srk/ksFDmAiX3iouUZcd
         hqeAJYqdaM212ZANVYvJRk2L1EqmUPtIepihFZojh9srmieJwyRyI7LSjxmCaCNGQHoI
         jDmWhef1S8ag9iuy9S3tG0E00R06eerTgodjD6uumLHRoJyhGaApR9510LAztvjkbtO8
         CWUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XP04DRNI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a8d259f336asor273723766b.9.2024.09.10.23.12.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 23:12:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XP04DRNI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726035121; x=1726639921; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+34vrWrHaGMzGum0dUZAL9TUKidQHtpHEuGMkrYa2DA=;
        b=XP04DRNImA6g+FPusF+nrDMdwPVbEwQgekky0CUldLZWEHBOUL45zTckyUVUIT4vgD
         qlEalNLx/gRQ2uL6/b0bCTuD9lraQqJgRfUu7mxpPyWBxHGYdYRCBW8vRz904Zf0Msya
         VOeV7L9PepY1PcuRW/vD+VOvQRm0VtJg5MnuV5fytzJg5L4GH2TdN7mx4eQ/TKVXe2Gp
         SV/aKzhrVcgtN3PBx8YKqUTDRpDFL+8o9+oCsdcecZ/4lj+89q5GrRqJeef8gCqPz7vB
         cUXGf5mBs2uPp7uRATtkI+FFubQNqujpIKzAQs4TOzGBNVIwJQQ/wp6u6s5ddgdL58Hm
         3nVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726035121; x=1726639921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+34vrWrHaGMzGum0dUZAL9TUKidQHtpHEuGMkrYa2DA=;
        b=aHuabDskuVK60K0M7h+rUu66tpetGTRxCa63MlnmvzR8BINnbG49FP07RiMexH3VMg
         CmLm+0ZCkv8g/m2azt70QhrPmQSaX0onFROQJrQIEJ9y5jQ4ge14c181RPjoUSESOUgk
         IZLaXKj471zSgC2lrVYOeSGCsAqre/fQoO6bbYX+zBvSLpsevUO+3ZNN+y6RUlOBg+PX
         fhWaa9ck8kHJlhmHskl1gSW4mX8NcUD2O3GPNrPROzn1McH5lmjXv4hzVklnfbfsZeTX
         STTatXMtsLcsASjOWdQ8QPGnnNi3ruAHdKtKkQXllZ6mp4cyyQNASEl+Xkk9cXUYO+Va
         asrA==
X-Forwarded-Encrypted: i=1; AJvYcCXhpCGTXb9wMm60gzazMrJwl3LN3HJ1b5BhGRKzLQWmt03c5PUWk4iChqG9YP4zIa2ZHM+1zIBioJ49qw==@linaro.org
X-Gm-Message-State: AOJu0YzBDtyDBjQ/gUN0Sqv16U+vinbpfx/YtqRnx5Tn17VHDJumkH9T
	gqREUpPQpBP8QvHSxQTVU549pBnVBpx1apnXhol60pT/k1TZbbMfLAk/F9k+yu0k1A==
X-Google-Smtp-Source: AGHT+IH4ooGDdGMRExue4kMMs1ung0TKQVFYie4NWRoJANGnBSzGpgLK0lpNkpt9jkOB2KoDESp7sg==
X-Received: by 2002:a17:907:efcb:b0:a8a:85af:7ae8 with SMTP id a640c23a62f3a-a9004798aa7mr202327666b.11.1726035120608;
        Tue, 10 Sep 2024 23:12:00 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.196.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25a25897sm571142466b.87.2024.09.10.23.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 23:12:00 -0700 (PDT)
Message-ID: <cca80b37-2640-4269-af72-aebccfa47245@linaro.org>
Date: Wed, 11 Sep 2024 08:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/39] hw/char: replace assert(0) with
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
 <20240910221606.1817478-5-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240910221606.1817478-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4S2J39H346rM

On 11/9/24 00:15, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/char/avr_usart.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
