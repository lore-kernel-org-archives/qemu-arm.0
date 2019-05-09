Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1335886wrh;
        Thu, 9 May 2019 16:03:09 -0700 (PDT)
X-Received: by 2002:aa7:8acb:: with SMTP id b11mr9098347pfd.115.1557442989280;
        Thu, 09 May 2019 16:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557442989; cv=none;
        d=google.com; s=arc-20160816;
        b=dpPwVwWMfJgkI85kU78bGjRnE20d2rSL2XW98K0q2bJ5/rWtlSHQ3S+fqwO/BLFUFb
         W4BMe627VO+q9TOJJ+X6Xl2BmX+Fi37TaGOfl3XgoST+7K6s7y46SlaJ4pA/xBRI5xKC
         FxKW5VErn6P3pvM36niriaccyB3INKyE5LpkWdcnHRf979tkmwJ4Nh03UgFgxI5Mmfzi
         mQUx21whVR4P3rO0qL5zO+PmBcSwGWMAI4eEXpcMJoKLm6ailSC7lRvjX4Ivzd3/aDoz
         CXBSBJ7xuZckHAQ8Ss09nmREi+elIvXlxd+lMnedim4DA/2+mTThJvQhDyXlxXsUhqUi
         Z1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=rlKpaJVBQlL0XT3HeqplK3PXLTGkK3kpZu2GVkTAO5I=;
        b=UGMiyybft8wYxtSrnhDumQuVUeoC0dKcgVHPxTpRy5wdxRf03VaJYvWtsLQKiIOsGW
         /f9+JC1M0FQdNq//ChSVK5CB7PFLQrvdu4Bczrap35CETc+1/B41kQXdU6rSnqkM2OYq
         K3gYRYIdO79qdCJ+ZcGbuEJ4zywJnrHatD3Dml+DAxP+vqfchW8NkEfi6JfvRY1cPQZA
         ovA4zq3YZA5uobT5naz/+AWxPEJQR5eAiEgR15RIBBifvZMthIJh2zepecXsLA78B0jp
         Yrcmb0DgIgJMebgnbq/TgYvtWeQ+XiXDSdGnzo1Oqes81UriQT7xmvx/QStOYcOlS3KN
         m48Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w7qmJifl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w6sor3881940pgs.24.2019.05.09.16.03.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 May 2019 16:03:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w7qmJifl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rlKpaJVBQlL0XT3HeqplK3PXLTGkK3kpZu2GVkTAO5I=;
        b=w7qmJiflHf4oAmri55f8tQW3Yuyx3OZ9lklI2lh02Jp4DxtSY+vT2DAYOxiOcYyLuF
         sKp7d6hGrh81AXH4drsmP69ufGYM+ulyymNPGEr58BHOMaRoUgt+8HWGLy3YICKNg3Gz
         byfao88jVhmfuoH55pExRUIMiaY8KakWc/aHixlMbY7dNrFjLHlXsQCY8hJ0jZ4CRAaJ
         nPXU4/g02n7aYk6MZg6hJyfQ7dmWgnBj86v8r9gTcnvFZbLy4kkzQYiiWBlSADM+4Fnr
         dHRgrq4IPTC5d91ZNhdF0aTvY9Cyu/OkF1NGGRTE+EiBT+tLBFia7fKA9uelWOiMkKYH
         I2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rlKpaJVBQlL0XT3HeqplK3PXLTGkK3kpZu2GVkTAO5I=;
        b=o8hsVCH8d+TEHvKgG54w/TBGHAPozFJkJJ8qPrE/BdO/4snmDkxqVcp9FzQ+0rF1ue
         RcqA+q5vmYNyRC0i+F1SRQj4gt7kMPFCGM4BoOdhcoxyfgS7M3q83M7kGcVd3lBz1J8i
         +66+TiJkR0gRGETkkPBdzCxjqom6qy+rF/RcV2qXoxQ4+JAhioeS5cMe5O0IxGTulsUD
         dPMO2ljmFG7zfLQ16jF3MCfgZRLF9m8lyhVTnWjHFRUQ+GkZqDv8gNX8RycbDPxlGcMJ
         ui/H4Er7szMIEGMGG9o/0DnUAWciVhlOb/k8D8XqyiTPd4L+Wzen6ql49oc+nqG20PeM
         kAbg==
X-Gm-Message-State: APjAAAXlWDObW10eq3zrjVWB9tSzmS04Vivr+Phsrb5MqQHZ/qn9pXyd
	C3JiiF41u8+yzmXZM/ZZgBAKwcZc
X-Google-Smtp-Source: APXvYqx2bKmMtzt7l1BTH+r/eTy8GU9/S9LNYXc0Bmh5BV1BrkheITf5rBPjCgdMO7GHxA6uJpAjdA==
X-Received: by 2002:a63:5110:: with SMTP id f16mr9277223pgb.107.1557442988894;
        Thu, 09 May 2019 16:03:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
        by smtp.gmail.com with ESMTPSA id n188sm4478627pfn.64.2019.05.09.16.03.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 16:03:08 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 16/23] tests/qemu-iotests/005: Add a
 sanity check for large sparse file support
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-17-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <512bc327-c8de-6df3-72d6-0548b9258f09@linaro.org>
Date: Thu, 9 May 2019 16:03:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509165912.10512-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 0Gw0A9jCpKuG

On 5/9/19 9:59 AM, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> "check -raw 005" fails when running on certain filesystems - these do not
> support such large sparse files. Use the same check as in test 220 to
> skip the test in this case.
> 
> Suggested-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20190502084506.8009-2-thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/qemu-iotests/005 | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
