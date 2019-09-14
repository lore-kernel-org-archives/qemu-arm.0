Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2210843wrp;
        Sat, 14 Sep 2019 11:16:00 -0700 (PDT)
X-Received: by 2002:a17:906:80d:: with SMTP id e13mr170304ejd.72.1568484960732;
        Sat, 14 Sep 2019 11:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568484960; cv=none;
        d=google.com; s=arc-20160816;
        b=ZjEldcvLE4aIAhtvVYkoR08jnHjPGWj5aBjoRFSstprVZkuPW6nwiYUY8sopS/1BUl
         FPucXFHYuOBOeK1ubmIzMT7pN1azZ5mqBrXUOfdPFcxU4SIs3jh1iIEi0fmrs0fl+4Eq
         NdeLCpoTTc+m7SsIghIjYGCpJNEo240xT78TnJs3kW6o4AkbO2wv0Xg80mbl8OaAAPu0
         Hp4DuCVMTZ49V49MilFlXkRVuUekpEkusWBwouF1T9O+6HvlAHl5fNziaIst3YCUt6b9
         H8QxJsY/egsAoqGvPpD0rd5N4CGjkZc06UrZcIX5rpjQD4EG9RX5R385oYqyfldiel13
         z3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=kka5U1eKjulTqQnAwTA54p3H1OYw4mv0KDOijnCkr+A=;
        b=gu5OZeZM7DD3plQ+KBhYfA3U28IStwHHM7nN+HRJIxOxhoiE07vcDYFNL7XUAzZMR8
         TpyXTA6aJb/O68Y21oAHFjzzXj+qx7mPHoVzHHoE2r240Qt1SOk86L8nzUIXdnzpkItp
         Fyg02NGEJYsF9aGoD5g5vS8K/qXsjZ1X+TVSVy05/Km39kxiW6jMfcdpcCBhufxNxqwy
         s2WhCt0guppGtL9mx7zpZipHmSndzwQI2kXuRcQJZYnj2Q5q/EoRSi55PW6JTeSjF2u7
         pYeqW5ieCC6JX6NTcg8Cd3yGYS6pUZsV0RfXJnMJEMTpxw+KVEix3dMNj6Eqnat4Hb8T
         FZ4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ycsBjFif;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p26sor12986814edy.18.2019.09.14.11.16.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 14 Sep 2019 11:16:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ycsBjFif;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kka5U1eKjulTqQnAwTA54p3H1OYw4mv0KDOijnCkr+A=;
        b=ycsBjFifs03M9M0wNRVpok+bEVkIkLXh33BuWeJKvYPIoIp4eOr6App3Z5Yx1m7+Xv
         3K/l3rcxLxA0mjk8+c5CoFQTJ48BOb/3+McmvfdRhhC2PdWURR92CvPF3IvZBtLe7RCm
         CLDYbiJQUEleJO/z1Umz08DMSW5FWI7/5lX4Ihs3P5vLIoifqrhmCo8QdW4AsHaEu3Kv
         F5M8bXdcV6DbNP7RuvEhCwOJJGmR7A6EYm5R9k6y25HEBl/925fkA4Oe9OoT0PI0szFk
         34j2TpWNswhe+HiTkXQtDwdBPjZoevR98y6l1A4DRzE3jOThstl8XAfFlrkXbreivNzI
         /7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kka5U1eKjulTqQnAwTA54p3H1OYw4mv0KDOijnCkr+A=;
        b=qzBPe8SuMbead8Hd+ET4X8fYyglUeUlHvMycWo0vaCUL/Ow4UsUMgRgfY4rTCLMXef
         9gUAPCJWwggi4hRlp+wOSMFVWv7JDlDS3r5bwFRPiITXSffHnmdpMBeWhxD38QV/beiK
         ILxBqBrQ3L41oNoGDjPzz9jP72fsSBj+6ZMDq4JfoZ+yvGqQlmRfP/NBecCBreJT/lk5
         u2h0e3Bt1fTyfPTRzNjovGXXJjXKFS7EiGvqQGJUMQRSGaNvU3MUWGEnFoOiXAgcrKh8
         PGZvC+F+lRF/JeHZOGeWuCGcQ5YJBbmBJAJ9CwbqA/6hr7F16FCOiWUL3MLOSkRrNeSF
         gr7Q==
X-Gm-Message-State: APjAAAXaqhBtnPAMywLVD1a/Zsbr6g/j3Ra9THwbyEsKJiaHxadBpDc/
	M/opwW2dl6SelAwcVHxSa9mTxAXe
X-Google-Smtp-Source: APXvYqzHsZzLQzI+PC3l8XrZGAZaH4l3P/bLE8YX/2EquUG1hntyEv/Om2j/qGuoMyaLJEXjAvgvVg==
X-Received: by 2002:a05:6402:1426:: with SMTP id c6mr38016603edx.53.1568484960424;
        Sat, 14 Sep 2019 11:16:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.44.107] ([185.81.138.21])
        by smtp.gmail.com with ESMTPSA id c22sm2271091edc.9.2019.09.14.11.15.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Sep 2019 11:15:59 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 2/4] elf: move elf.h to elf/elf.h and
 split out types
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Jia Liu <proljc@gmail.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Fabien Chouteau <chouteau@adacore.com>,
 "open list:S390-ccw boot" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Richard Henderson <rth@twiddle.net>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, "open list:PReP" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <01c627ec-9382-d4cf-4a61-b4267c3267fb@linaro.org>
Date: Sat, 14 Sep 2019 14:15:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910193408.28917-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: MYOb1RHR7SIv

On 9/10/19 3:34 PM, Alex Bennée wrote:
> Most of the users of elf.h just want the standard Elf definitions. The
> couple that want more than that want an expansion based on ELF_CLASS
> which can be used for size agnostic code. The later is moved into
> elf/elf-types.inc.h to make it clearer what it is for. While doing
> that I also removed the whitespace damage.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

This patch is hard to follow because it moves and splits at the same time.

With this patch split into two,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
