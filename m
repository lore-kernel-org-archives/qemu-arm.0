Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp90309nji;
        Wed, 11 Sep 2024 02:35:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsDvhKOJGrcVLXM+QiXjptElWdYPKpBXXuHZD6kz4WWsARK13D2wYMbkgqULZJH3DXsYRd84oexXUYIQ==@linaro.org
X-Received: by 2002:a17:903:24f:b0:203:a046:c666 with SMTP id d9443c01a7336-2074c4b35f5mr59741545ad.3.1726047340551;
        Wed, 11 Sep 2024 02:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726047340; cv=none;
        d=google.com; s=arc-20160816;
        b=Ph0JAkatcikSpQ2gnghKqS/yQH8z18TZhRpHOwx+Fru/SzQ7W6Z/TxD3+mh6nUBkHH
         YsXLG4fpuVcUBrnjfIysaH+6LWNpAWWvm5Kx2K2QaQc/eadFT9iHJR8EEPzXkxZtNyqB
         pWat9d7KUMW0R4h66a6pn5rue5wIsPWxr14kU+WFhIAddChho68rHLIiR/ACpIohf0bW
         RTTK2pS5bY5emLKCqQhUnvfDqOfo72PsneuEb9xzGZLnn4p08l7ldcwyjgNiRIfGz4Wl
         METDSM9AxxkEG+P69WXvUxiwpy1RDPzoktrk8Umhd1lN8xEDbzfj0zvbHdlIXHZDhvhA
         Dl+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1u4hLYLb6JvJyT39AyvjEboo66L18yRm1sqg09O3j9E=;
        fh=Iyzq9J9UuGpeEWruCoVUjbAUfvhN+Fu0MWJNu81toPc=;
        b=wTc2Fq6ZzaoPfK3LkxlyLrw5FJj8+eqZlWFacynp+QbQ2wD5kbtPbkKVNuCDKU4jpY
         E0k1bCPxPbSVNfeELWXMI9YOHzH/uTBHDgX2hk/k93GuZMn8Mu8ylPKj0BkV1nv3LqPy
         ATyQGAsEM/uV5Ny9S/ZaMA/h24N79YQofZ2ESGp7qlZ1XOjFbk3/F6YrH+7EmzEVgksa
         5w1gyvFKseucb0Wj24PX/lALkb1dMhaXAxZyj1MdLF5PhlbM7hCOxgemG6yE22XnHVib
         2YND3727miz7ZqRRgCZUo23gp4Zb5tbuKvfBEQZyyAYENYwusLQs3fRonY3BM+DsP8Xz
         1NSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=XOstnMv8;
       spf=pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dbarboza@ventanamicro.com;
       dara=neutral header.i=@linaro.org
Return-Path: <dbarboza@ventanamicro.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20710e2d8b1sor53786135ad.1.2024.09.11.02.35.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Sep 2024 02:35:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=XOstnMv8;
       spf=pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dbarboza@ventanamicro.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1726047340; x=1726652140; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1u4hLYLb6JvJyT39AyvjEboo66L18yRm1sqg09O3j9E=;
        b=XOstnMv8f9FLPdrH9cv4XZFJ1xeUFfI5V+Kja/teOPwdKYdvos64bmYM+C3V0wPumP
         jVI+kEi2SL7uviqeQi+2+QBF+M73J3yqgkIBlJzbRrL2siTYq9MfpgYUmhcNL2/zNXfu
         4ur408sAw3GBg54CTUyaw274gPpCYTI6qunigMCLEVb0bV5B4HFd3doQiE0qSFZE4gDV
         Nf2Zz2jowyxitP+L8qXarwr5OYjg+3hHo4x3jEykxrePBNifqaknG5Kd+93235aWdpm9
         1G2fie9aHtruSd+ESmI/r8vDFNosopAFbLprk35/w4N/EOkTBfwcZ2rO6F7L+OXS+vTu
         EV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726047340; x=1726652140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1u4hLYLb6JvJyT39AyvjEboo66L18yRm1sqg09O3j9E=;
        b=FAyYrB8zFcl0SVNATAVoqPp2r3TuR6zdgJD+Oo/j7T8IqgXxt6RD1AbDofsX8Uifp4
         JWNfR5xm/dqSnxYr6/kGIi7GevNM/IkrnRFzyzqoeyvgJsfpthtz9GQSO9E5/2qNBf5L
         QcUH9zMDtVvFBmH6uw/YNVBfgGBmY2MvC94eFeRgszXjTxmZYwRYOx/C7B6Njsm9D7jX
         QDujylphyOaJh1lMqW4kZ8ogVmk1l4w4jwd92nz7u5Y4BZPG8c2U9/EE7VRHCK6kWe6p
         oA+B+qWQL6q5R0UQt2PFQcdm2TBtU3aDi1G+igPsKIui/gSwENBEc5cC1Jam2OA14ZZ7
         Ufvg==
X-Forwarded-Encrypted: i=1; AJvYcCUFejxbgh8uwx4njjLWTezFWnik4S1Vd8fMPRChNvd9QykHrnKYJym7Vwjhf2k9KeEOuPk1WKu04GIkJw==@linaro.org
X-Gm-Message-State: AOJu0Yypt0Jy2lhkdJRnqB3YsPqX72H+w50WnpxVFXg6ozkRJt9tYp6I
	6Rr/z1Jn/Abh/yC1QXRUnjLXLra8ntD7PXNkhopdCgO2/3cwPmZWn3GmPt2s5hk=
X-Google-Smtp-Source: AGHT+IFUx/BwHC24gWqvFB3GjiXa6Pwl4/OE8FDUMSu9YsViqYb7FQaE3SBpFeH2lAaF7lGvC5UgZA==
X-Received: by 2002:a17:903:290:b0:207:3a53:fe67 with SMTP id d9443c01a7336-2074c5f7f19mr61649475ad.32.1726047340049;
        Wed, 11 Sep 2024 02:35:40 -0700 (PDT)
Return-Path: <dbarboza@ventanamicro.com>
Received: from [192.168.68.110] (201-68-240-198.dsl.telesp.net.br. [201.68.240.198])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8255dc0d4sm6861245a12.64.2024.09.11.02.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 02:35:39 -0700 (PDT)
Message-ID: <769135e9-c377-461e-86ed-e4e1de6ff0cc@ventanamicro.com>
Date: Wed, 11 Sep 2024 06:35:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 34/39] target/riscv: remove break after
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
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
 <20240910221606.1817478-35-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240910221606.1817478-35-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: hAZ+DPwb+8ww



On 9/10/24 7:16 PM, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/monitor.c                  | 1 -
>   target/riscv/insn_trans/trans_rvv.c.inc | 2 --
>   2 files changed, 3 deletions(-)
> 
> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> index f5b1ffe6c3e..100005ea4e9 100644
> --- a/target/riscv/monitor.c
> +++ b/target/riscv/monitor.c
> @@ -184,7 +184,6 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
>           break;
>       default:
>           g_assert_not_reached();
> -        break;
>       }
>   
>       /* calculate virtual address bits */
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 3a3896ba06c..f8928c44a8b 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3172,7 +3172,6 @@ static void load_element(TCGv_i64 dest, TCGv_ptr base,
>           break;
>       default:
>           g_assert_not_reached();
> -        break;
>       }
>   }
>   
> @@ -3257,7 +3256,6 @@ static void store_element(TCGv_i64 val, TCGv_ptr base,
>           break;
>       default:
>           g_assert_not_reached();
> -        break;
>       }
>   }
>   
