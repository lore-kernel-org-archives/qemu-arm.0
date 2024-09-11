Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp48168nji;
        Tue, 10 Sep 2024 23:12:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqcsQ0VhHApQ1WveXywNDSF3+d0kwrjtiDvrtaSjnMbYGe+VgetKaVgPu/KwSH2YgAmKj//39/nXIayQ==@linaro.org
X-Received: by 2002:a5d:5746:0:b0:374:ca1d:85ad with SMTP id ffacd0b85a97d-37892466e5emr10449864f8f.56.1726035168185;
        Tue, 10 Sep 2024 23:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726035168; cv=none;
        d=google.com; s=arc-20160816;
        b=mvkj6rVjfksVNHxmP4M7hX9VzK7LB4i75q83e8xRuM8/ERj0NU6H0yhbDx7FE6idd0
         Up+6ls6HBQzGXs9tm2HxLWyBOcp9MWfZLq4p+covDa+xWsL0hFaTE4C5dAXiJWYIqSV1
         1mfx70NGdYEdPPaJ5bU0yIL/DM4Aog/w/u3FAqBBHV0r/ZmzZSbFKP+4hllQdmNZ6ot0
         NEq06Dd0e5eD3g2AlBHSK2L4UqhVqZ93Ag8sRfgXuayO19XcecbVzHEVnCKD+b9gWsYD
         Um3HEQYOrC6laIqgIhS4C+UOllPAbf1l2YeOcC6tsz/egXRM1ce3vIBWdv4Azq3SWkLR
         xqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TL/lFv17AlRRni3BjvbBzcjoUvGtXN+SvzpuJVUHQg8=;
        fh=LxIWt/qi2jsi3h0aPqPs1uZaqUcNO5g/lF/Np9QryNY=;
        b=uni8B9yU1TpVfPvfSOMEzcYPAFNgc/fyiFFsUzAxFEtaJUZExuD/5xafSjy7YHbs7I
         NAmFB9Q00Lq3EF46d0hcPbXiq0GeMmzh+hHVz68mP2i2/kL0iTFs2DTQBNJ8jwK6Vzel
         tHrtQ4Dno11eila9g9DMqphy40Mvmjwj/GYCG1qUTgSY/A2CbF3H3jmy/xmo3S8TKe6A
         DTvVJRgoRMNziP4wPIWrLOrx5W1YeoXfqQrPR8272pIkKKkPKSMc3GadLJ95wRiHkowP
         lpzbmq3fhjWsrZxBXNLrxiR3ORHYqqFpwhcS2zyfncfx0nN9Heobz3mW8Ablv1UeF+zw
         Y+Ag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eKCE5u6X;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-37895603bd0sor2741144f8f.1.2024.09.10.23.12.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 23:12:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eKCE5u6X;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726035167; x=1726639967; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TL/lFv17AlRRni3BjvbBzcjoUvGtXN+SvzpuJVUHQg8=;
        b=eKCE5u6XC97YATKmwsysjY3RMeBzqv+sjDxrCIxDVm0DmbY3oi0+dTxRm13NePMP2A
         QDfKP0YL1/ihNSHGWw3of0EkJ8PdU8My57iIriuWti7I6rHvvSwNuE+gPqHKYQ7m2dhs
         106jqP4YzZ0iSfKKdSZerx2I0COuXtw/R6IdjUgAq2Xw7lPYD6C8R2Kouh+YXFbA6mPU
         qShM0/lU3HmCfjiEn+/yNYKU6Q07nZkGzwMApLc7OARsk+slt+EtiAc4pNpLd2X6S5Dq
         cRcqFjYPqZPfBTkzCamRnZELVZ476hquWSdGch1mVmmDrT/bT4n6SMOT6ZABMjjz12TW
         KYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726035167; x=1726639967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TL/lFv17AlRRni3BjvbBzcjoUvGtXN+SvzpuJVUHQg8=;
        b=Ln9xNIsTLH+vruQSbHqvJij6M70kR6kr88a2lruBzIsbnM4C6JVR/9AxlABjTd9aUn
         EhbcBaROAqXCXAseazGVfSwbvL2RXYhVOUHq6zZrCVuiSRgJLNAMFgGCiDMdi7MwcxtS
         zgXOok3MV5wE4ZL1Wgu8cdjncV/000QE7U49u9dfiyaZ+0X/ln+W/Yl5xV0PTloM9xQk
         mImMz7zvG6yoMFxCo7FcGm+lOef35RSOrn5MfJv8y7FI+HmsTHx3N1o40zZvSbsLYqCN
         jpZarnPFeGpScQGu21Qe6Gh8ryEyDeO/uWI/lpCmJpe1R+w99KBoUgCmlPz9doBizb+n
         GTwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQpA9XTDGWL8sZjvqFEt3BR4G924h0ZcbWZESdeew/pqBca5o4mClyxL2Dr+vqpfVvww+au4W459jlQg==@linaro.org
X-Gm-Message-State: AOJu0YytPNV/qqIItVN4A3vF7bZr3Egu4AouNJNhzrJpRFiF2oTrwb/o
	Dy6p2QXGPnMfbShQgVPtV4gr5e/W6kvlS9ym7n1ovuXuHyn5rz3TYgtVHFcxthRGCQ==
X-Google-Smtp-Source: AGHT+IEc72IfoqLgZowTqWigpNIlUglrPLMS84A16dLv8yLW+1D3kLeBnbG++tZCCJ+vQoNT+RC+RQ==
X-Received: by 2002:a5d:6a0b:0:b0:374:c616:54b2 with SMTP id ffacd0b85a97d-378922a6a85mr12171475f8f.19.1726035167475;
        Tue, 10 Sep 2024 23:12:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.196.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cefa24sm581411166b.178.2024.09.10.23.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 23:12:46 -0700 (PDT)
Message-ID: <f6db8937-35f5-4ac2-ae78-d5043cf5d440@linaro.org>
Date: Wed, 11 Sep 2024 08:12:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/39] system: replace assert(0) with
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
 <20240910221606.1817478-11-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240910221606.1817478-11-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: I5E4a7sL0qqU

On 11/9/24 00:15, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   system/rtc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
