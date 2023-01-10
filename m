Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2896752ejc;
        Mon, 9 Jan 2023 21:52:41 -0800 (PST)
X-Received: by 2002:a17:90a:950e:b0:223:2edf:857e with SMTP id t14-20020a17090a950e00b002232edf857emr69620116pjo.8.1673329961032;
        Mon, 09 Jan 2023 21:52:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673329961; cv=none;
        d=google.com; s=arc-20160816;
        b=wYkVu/VdnIZu0sFkbIzcWI1IdDdhojhdCzymouG7s94z8r4PuxZdINtjbr1l0HIWov
         MDLyQNyv8D4WnfHmoxLS/pGjG9jQX9O8K1xylDgFhfx3zJmjuGyTfk5Qbx5Vra/so3K1
         MpHlotH4wrT0m7YkuoUORHZcGl4zYS6jlkGRv/q4lzylLEhjqYpfPYicU/UUkCf6HoT2
         VQX7NW3D2ePE/pNKJED+eUSvumILcbU9hiCZhwYXhKBJL3FQl2GrO5MGZsO6RlcmiHQD
         df29lUlP+DLa+ZH/X6C1vZFutcMPp/uq/XkjM8uvaQPdtbeadSuNdEMWDh0sxCQtPfy9
         aURQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2/nl3OM2e4VnI5Xc7P1UglEp4ZguT0/4xQCN6nGkq8c=;
        b=azHHi53rI4iP3yZqtAyOIJ1LqdmVgc2rm5MTh5jrIRkRG3z+w/mm59XW3oARCbND4y
         y7PvMkL5EO4+RHHO0Y76U6Z8cNZ7BVsq9fmEpJF8SI/ztPCamH4JHE5K7iyLpKtXAEsa
         EKxLG/F5R4m0hJh7u5OB5FKILNYerwRWhaCaRuOhJ7lhFY1B/3BuG3cVbjwRohCnsqkw
         CAU8XsaOU4KiBU+RJVecNdQIPSaajgRfiwSmLtZRbwU64V1Jdc4TToY0gMhGN6Bk4o9q
         UVf/al5LvfBlTrRJdtFbUA5ruYW8SNqTg21IfV/bSQb8gOJTyZ50TNcsxT1UilRvBArr
         INXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ciYnSxB3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j5-20020a17090a738500b002192da8ccb8sor6655716pjg.16.2023.01.09.21.52.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Jan 2023 21:52:41 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ciYnSxB3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/nl3OM2e4VnI5Xc7P1UglEp4ZguT0/4xQCN6nGkq8c=;
        b=ciYnSxB3vMyKEBAaGJ+Zqg3e/pScy4n/KXPByE+Q6/XqAe9QWG6RXwcl7xPE+Tn8KZ
         CCiKJOK0lc2UlhrKKP0TEcKv3e0FqyVqxG0imhAJF1qczTVxDP2otq/Ge/UUoFbEEVEN
         51CyIYXEXS+qVSqEXUeD+1+7Mt6vHu48neF4YcgEO5HTM7b62fuaQgim5w41w75wY7+d
         ZddEIwhSdmOo2HZmMbTqh8Kpmy6G5kzu7d043W5D9FfP+HuzmfqjlLfow+wJsYrGbqN2
         0/H9eWuV398fySCNWICNo3FnsaRNWj8osPfEx0/Aqt9Wdsy3ZZmtEfbPEUnzmZw+PBeh
         e0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/nl3OM2e4VnI5Xc7P1UglEp4ZguT0/4xQCN6nGkq8c=;
        b=CMggDO01DiJbZCgTOr+HSFt/GDdcnpB7OnHaElBvFyaXPf2HCBJlF9wlTiwqyI6huW
         wqrgj9eqVW1cQQucwP+/111roi6QKBJWjpzkHSnSfSCe+MMNJsZzVlE6pEd1S5tlUQPO
         714QB2u5gcdj7wKYR1REF29L5i77tn0ryOErXIyjbyA0eoNdarQXLzcT0kpW1CqtkxI3
         0UOKT8jTF/2oGDfG2dbkpq2vlJcrt3bCei+mo9X19AcmXtqRewRH1lZrdLAVc0FXy9C/
         pvJV5FdJWazW905Z2Hflm8BcrSndrC1gO2LIX6ZxJfKw3MMWnhoP6MxzHa0X3hAKiAti
         JrNw==
X-Gm-Message-State: AFqh2kr00q1HAoiMPx1uuiberO8VEWbQyXrXv1m23vHgiY8W1pX46Cq2
	I6bf23TCidD+llkcfiWibyoKwGadFyfSJC6c4+s=
X-Google-Smtp-Source: AMrXdXt5IGcYtNL1tB8lr5UwKavyz1rdNmCt8HELNfpCRGah+6ICx4thtkyqdStx1QSYJSqC9i5rvA==
X-Received: by 2002:a17:90b:70a:b0:227:62:8169 with SMTP id s10-20020a17090b070a00b0022700628169mr8333960pjz.35.1673329960504;
        Mon, 09 Jan 2023 21:52:40 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:fbd5:d294:fb18:71f9? ([2602:47:d48c:8101:fbd5:d294:fb18:71f9])
        by smtp.gmail.com with ESMTPSA id fs7-20020a17090af28700b00218abadb6a8sm6392857pjb.49.2023.01.09.21.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 21:52:39 -0800 (PST)
Message-ID: <c1541118-b5fc-d39c-cfc9-e4fa2d83c801@linaro.org>
Date: Mon, 9 Jan 2023 21:52:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 07/19] target/arm: Move helper_set_pstate_* into
 cpregs.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-8-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109224232.11661-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: GbH5CdHyKIJ9

On 1/9/23 14:42, Fabiano Rosas wrote:
> We want to move sme_helper into the tcg directory, but the cpregs
> accessor functions cannot go along, otherwise they would be separate
> from the respective ARMCPRegInfo definition which needs to be compiled
> with CONFIG_TCG=n as well.

Hmm.  I would have hoped these could stay tcg-only, somehow.
I wonder if it warrants being an ARM_CP_SPECIAL_MASK value instead of svcr_write.


r~
