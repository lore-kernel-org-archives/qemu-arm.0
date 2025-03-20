Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1044506njc;
        Thu, 20 Mar 2025 08:46:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqHR8bJ3rA5UuiJjYoyvkaUKPf3UNt+WkylywAhBM4eB7l4mndR9qVOclkGP9L6PSVTjRVzFGHpVaXjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHdLNQGm37YBMlnh5h3+M0YQcp07k/bzUB90Eflfi9x44Pk2oc+0GsWhowtUVmk8trpagFz
X-Received: by 2002:a05:6808:23c2:b0:3fa:53b5:6f87 with SMTP id 5614622812f47-3fead610777mr6006568b6e.34.1742485604598;
        Thu, 20 Mar 2025 08:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742485604; cv=none;
        d=google.com; s=arc-20240605;
        b=gdGfkRpd2u1z4gIct+YdKEbU6kntZhwpUsEyjA702qfr5BBHGUCyZyQ7k7nWPQigv+
         Ned4ig4tl4L8eSWq07xi7yx8OqQoejQgW1sBjIaIihzeWGIQ/Qpb1Bx0exw4mz2/Xvn8
         HzorJd9L8wNlMIhB9S1AJyWzVTGEk6iQtu/SnTgn95Zhh5SRPYrjFfJGWuAUSTdBdFro
         VcLCkW6Xw+QJmRIy1ZnPll0sRa0ysgtAHcswLGKHt86C1GjyAlX5ucoH7ldqGDxT7bA+
         N0I/22rH3ITAwogPSo/kPbjl72ArELjcbfULg2mM3dh5363H6HIMm8HUWwr+wEt1Kylo
         JXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=HslmlnQwOo6JvynSQuem06I4JILJtTZsP+BQG1VIez0=;
        fh=B9aDCXAh5ZNA79C3FWxXbhxpRCGGPK8zN2gSJye0irc=;
        b=g9Kr5OF1otsn9iJrUs6WtZs2e3Y1kS6H2i3JvvyweYuX/ltLYE2f6o7BSkuX+E61I/
         AwVulb7hQ94tmrSZ9P+t4IRCQGHT3POb3Fkd8VxXHPKn/PWzDsRIHTk/o+9+D7yl+6pE
         6LkBfeRIagIzxnSpMEP4Pbyi1KlkM5dCtYvuNFNViFn+F/xkOFG6tquvSmJhQwGPsGFd
         PwTUVStRruFX8XApgo9uATIXvZCqo8E+cyTo0gOEyUWfDUJtcQps1tLqj8CXZkOqrlxz
         Hh1a71yK0O4VPWszYHeihc+b9dA3kAHg9uTF9GrP1L3sNhtlBeHaN6B+8H1g6/APZb2H
         gWcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bZThTHYP;
       spf=pass (google.com: domain of sebott@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=sebott@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <sebott@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 5614622812f47-3fcd5cf7dbasi11035967b6e.123.2025.03.20.08.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of sebott@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bZThTHYP;
       spf=pass (google.com: domain of sebott@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=sebott@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742485603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HslmlnQwOo6JvynSQuem06I4JILJtTZsP+BQG1VIez0=;
	b=bZThTHYPnUMYToLcA66BRNjsG0eC+GtlTWMKY0tWvAcnczZiHWkOh2g58T8mE3RGCQ+Wne
	MTnzTZGXRxtaDuetuJUVmbuW+2XfFBkwD4FnFfgBQ7bPQzVryH5WS/AMBzNW9NTJxWI2se
	+3c+MK99jXagHy5Ca79pWkWMLHZV9hM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-RWzUuyLcMi-p2uRnHZsQXw-1; Thu, 20 Mar 2025 11:46:42 -0400
X-MC-Unique: RWzUuyLcMi-p2uRnHZsQXw-1
X-Mimecast-MFC-AGG-ID: RWzUuyLcMi-p2uRnHZsQXw_1742485601
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912580843fso730110f8f.2
        for <alex.bennee@linaro.org>; Thu, 20 Mar 2025 08:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742485601; x=1743090401;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HslmlnQwOo6JvynSQuem06I4JILJtTZsP+BQG1VIez0=;
        b=vcN9shabbgTLC8Y9v9R/KO/OVaWirId1K+Z69yxnc2rTq+dHoYYrjdq55uRxbE2QGz
         Pgtr+jGijy64eXwaSzhNqNVObj0x8oj0Yx1HfL9nHMdQ7nK+iwiG236beSmnas291KnE
         rXszazOUCklI0qyIobbZkuWpJNKDuhQ8MaYSAZ3asskby77UWmC1zHJ6Lxm/HSn0ax/u
         yIQjxeqKoa/i8JJ2eZDjDM9GqVQZ5vZuEeM2B5fJKG382xaWEwRuipxptXwwMXz3YhAi
         9AbDMI9zLQYRE+yJHxEyqcmK0wNlwmq7hQ3mV6nhH6Ot6j4/w3p7/9vjSONA+nLA2mTj
         52+w==
X-Forwarded-Encrypted: i=1; AJvYcCXbPq7/BOfwRXWkstTKelORPfUpIfx46aQkbmL2qLGnerVGbl86pyibo3johXDzg0FmvbMiLNtxvWGMGg==@linaro.org
X-Gm-Message-State: AOJu0Yx7H8UZwuaPUl1K1Gxm4iz9vvdxAfrPvE+wX4J0Zt7zcsfH2BSd
	L6CYGyh1kgPyCJNP7IaQY4mk850m8jURdgOfpdaOCphnN/GL+G/5PS2rAPDV5TFwufZO58m/Y7r
	hUoXuqPa9Jv98+CJLQnO+Lv/B1ZDIC0UiFtZDiEer7wuK5vq3XR5Guw==
X-Gm-Gg: ASbGncvDKFfS5vzalNcxk1iD6AggtxWFlinyZZTEtXdLNqE32MH9p885G7tuX+EJXNd
	ElY84NgZkZefmmO+GObQcWyxHVxhJpf47fL6mQYN7SvsAsQRc/0mGcJu1Q8VSGDE2ZWN7cEQjTu
	O9D8R1DYlAFWQOB3X4XN6h5eJu3c1sZUIezAypzAXrKP8KR9raGRtNR7hVnGMsryAMDRsQJNQ/Y
	DzBA8PVHtTYMyO30qazu7f7X3R3R3sNo9JDif4LcMsNMOZfhaklrcK11zpgVPT+vGhBqT/RMzU6
	axkdkecXX4SxxYyiyKG9Aph/5/mCKG/epQBRudc8/LoXSS0uW+wBCSOeqmoKV1R5
X-Received: by 2002:a5d:59a2:0:b0:38f:6287:6474 with SMTP id ffacd0b85a97d-3997f8fc43dmr8305f8f.15.1742485600662;
        Thu, 20 Mar 2025 08:46:40 -0700 (PDT)
X-Received: by 2002:a5d:59a2:0:b0:38f:6287:6474 with SMTP id ffacd0b85a97d-3997f8fc43dmr8278f8f.15.1742485600138;
        Thu, 20 Mar 2025 08:46:40 -0700 (PDT)
Return-Path: <sebott@redhat.com>
Received: from rh (p200300f6af11ec00f9928575aec32536.dip0.t-ipconnect.de. [2003:f6:af11:ec00:f992:8575:aec3:2536])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c4f9d59dsm24220135f8f.0.2025.03.20.08.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:46:39 -0700 (PDT)
Date: Thu, 20 Mar 2025 16:46:38 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
    qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
    richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
    oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com, 
    armbru@redhat.com, berrange@redhat.com, abologna@redhat.com, 
    jdenemar@redhat.com, agraf@csgraf.de, shahuang@redhat.com, 
    mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 00/14] arm: rework id register storage
In-Reply-To: <20250311162824.199721-1-cohuck@redhat.com>
Message-ID: <acb05338-1256-aefd-0283-9bf801256d82@redhat.com>
References: <20250311162824.199721-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f6xSusbAQBoxZiCBZUKU6l0Qokcb4Jpj9U-39QKfRbk_1742485601
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-TUID: cRB0Wsvi1iqc

On Tue, 11 Mar 2025, Cornelia Huck wrote:
> Yet another update of the id register series, less changes this time
> around.
>
> Changed from v2:
> - changed generation of the various register defines via the "DEF"
>  magic suggested by Richard
> - some kvm-only code moved to kvm.c; some code potentially useful to
>  non-kvm code stayed out of there (the cpu model code will make use
>  of it, and that one should be extendable outside of kvm -- a
>  revised version of those patches is still in the works, but I'll be
>  off for a few days and rather wanted to get this one out first)
>
> Also available at
> https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v3
>
> <v2 cover letter>
>
> Changed from v1:
> - Noticed that we missed the hvf code. Converted, compiled, but not tested
>  as I'm lacking an environment for testing.
> - Hopefully incorporated most of the suggested changes -- if I missed
>  something, it was unintentional unless mentioned below.
>  - fixed repeated inclusion of definitions
>  - hopefully made macros more robust
>  - removed distinction between reading 32/64 values, which was mostly
>    adding churn for little value
>  - postponed generating property definitions to the cpu model patches,
>    where they are actually used
>  - juggled hunks and moved them to the right patches
>  - fixed some typos
> - rebased to a more recent code base
>
> NOT changed from v1:
> - definitions are still generated from the Linux sysregs file
>  - I still think updating the generated files on demand (so that we can
>    double check the result) is the right thing to do
>  - I'm open to changing the source of the definitions from the sysregs
>    file to the JSON definitions published by Arm; however, I first wanted
>    to get the code using it right -- we can switch out the code generating
>    the file to use a different source easily later on, and I'd also like
>    to steal parts of the script from Linux once integrated (which I think
>    hasn't happened yet?)
>
> <v1 cover letter>
>
> [Note: I've kept the cc list from the last round of cpu model patches;
> so if you're confused as to why you're cc:ed here, take it as a
> heads-up that a new cpu model series will come along soon]
>
> This patch series contains patches extracted from the larger cpu model
> series (RFC v2 last posted at
> https://lore.kernel.org/qemu-devel/20241206112213.88394-1-cohuck@redhat.com/)
> and aims at providing a base upon which we can continue with building
> support for cpu models, but which is hopefully already an improvement
> on its own.
>
> Main changes from the patches in that series include:
> - post-pone the changes to handle KVM writable ID registers for cpu models
>  (I have a series including that on top of this one)
> - change how we store the list of ID registers, and access them
>  basically, use an enum for indexing, and an enum doing encodings in a
>  pattern similar to cpregs
> - move some hunks to different patches
> - update the scripts to generate the register descriptions, and run
>  them against a recent Linux sysregs file
>
> What I've kept:
> - generating the register descriptions from the Linux sysregs file
>  I think that file is still our best bet to generate the descriptions
>  easily, and updating the definitions is a manual step that can be checked
>  for unintended changes
> - most of the hard work that Eric had been doing; all new bugs in there
>  are my own :)
>
> </v1 cover letter>
> </v2 cover letter>
>
> Cornelia Huck (2):
>  arm/kvm: add accessors for storing host features into idregs
>  arm/cpu: switch to a generated cpu-sysregs.h.inc
>
> Eric Auger (12):
>  arm/cpu: Add sysreg definitions in cpu-sysregs.h
>  arm/cpu: Store aa64isar0/aa64zfr0 into the idregs arrays
>  arm/cpu: Store aa64isar1/2 into the idregs array
>  arm/cpu: Store aa64pfr0/1 into the idregs array
>  arm/cpu: Store aa64mmfr0-3 into the idregs array
>  arm/cpu: Store aa64dfr0/1 into the idregs array
>  arm/cpu: Store aa64smfr0 into the idregs array
>  arm/cpu: Store id_isar0-7 into the idregs array
>  arm/cpu: Store id_pfr0/1/2 into the idregs array
>  arm/cpu: Store id_dfr0/1 into the idregs array
>  arm/cpu: Store id_mmfr0-5 into the idregs array
>  arm/cpu: Add sysreg generation scripts
>
> hw/intc/armv7m_nvic.c                 |  27 +-
> scripts/gen-cpu-sysregs-header.awk    |  39 +++
> scripts/update-aarch64-sysreg-code.sh |  25 ++
> target/arm/cpu-features.h             | 317 +++++++++---------
> target/arm/cpu-sysregs.h              |  41 +++
> target/arm/cpu-sysregs.h.inc          | 170 ++++++++++
> target/arm/cpu.c                      | 111 +++----
> target/arm/cpu.h                      |  80 +++--
> target/arm/cpu64.c                    | 128 +++----
> target/arm/helper.c                   |  68 ++--
> target/arm/hvf/hvf.c                  |  36 +-
> target/arm/internals.h                |   6 +-
> target/arm/kvm.c                      | 129 ++++----
> target/arm/ptw.c                      |   6 +-
> target/arm/tcg/cpu-v7m.c              | 174 +++++-----
> target/arm/tcg/cpu32.c                | 320 +++++++++---------
> target/arm/tcg/cpu64.c                | 460 +++++++++++++-------------
> 17 files changed, 1218 insertions(+), 919 deletions(-)
> create mode 100755 scripts/gen-cpu-sysregs-header.awk
> create mode 100755 scripts/update-aarch64-sysreg-code.sh
> create mode 100644 target/arm/cpu-sysregs.h
> create mode 100644 target/arm/cpu-sysregs.h.inc
>

Reviewed-by: Sebastian Ott <sebott@redhat.com>
