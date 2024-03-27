Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp402779ejv;
        Wed, 27 Mar 2024 04:50:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVACMKw7eoQ9uqslx1FNF91qd12jHMKkRp82jG4E3xnAj/OEpOdlk+VGGDZPMIwMDJQSQ/dzwa0+lM48bSDkwkm4DfiHm8M
X-Received: by 2002:a17:906:911:b0:a46:a646:244b with SMTP id i17-20020a170906091100b00a46a646244bmr3344819ejd.34.1711540223886;
        Wed, 27 Mar 2024 04:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711540223; cv=none;
        d=google.com; s=arc-20160816;
        b=mdVu8cQsCAYQb54aRytWMUSRE6GEl3xXbXBoFLY0o3J71HvS8UlSqAObeYv/Rf8LFC
         FH/bzLZgNwobBpHeIdOjajjblmOhV81GVOiIAOQXOTWn260zNNuWoxtIxu+uumKVmiOM
         sM2Z6WMLxcbHn71xMLnWquRvTbiurCFUJuGTHUhwUKAEXqoxsQ9apZrs8ZMajJUR0cqk
         mzMUty1RfF7z6ncfPr49U2CzYZ73y3C34OZq07ACysk3LzrEhtOvEqZa5yVTL3q9g4iQ
         uYXB/47CV4v9UxHgwl68E6b0yq8ARDHxSoCTasy+96Ke5G34mJiS55UQ5v7EV36WA84O
         g2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=4FC6f2CiQL5W1YZBJ6SK7a0UwL0NwwFJDhTY6Z9yEh8=;
        fh=PSZXdejtZsH3xR5OtrfWEju+g2gRF/Q5aBpiwOZWEr0=;
        b=oGvt6sM/vewJp+mZKcqYrwyO4KkVKtb4+HcCM/8ahuR1tWyDFErf+9wg0igSUK/jzr
         Xpl0IbgDkQ3wBrgZsJAfiKUJ9iAELbaKX5N/OgzNrpVOV+z9ocFcezVhGdIwiGMTibAK
         Mo/OVbALDBalOzztmrjwA7yOi7NSWFV5TPhn5mHE5daMDPBd330FB1txnhCjpqtmzK1Q
         ZvdjGUn9Qls1Delphz2clMU9xJk4H1kjDdqwUvTrfkzYEw720+k9dtHy/4TMO7JtWbFq
         1EIGBTa4t4/38CXVf7rt92oimVUERcj11tnWjqAT/9PIwvqCx0wW3dTa/gehG90FhGnc
         rHUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=YW3Z0EXC;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
Return-Path: <anthony.perard@cloud.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y24-20020a170906071800b00a46f27d20f1sor612760ejb.1.2024.03.27.04.50.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 27 Mar 2024 04:50:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=YW3Z0EXC;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711540223; x=1712145023; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4FC6f2CiQL5W1YZBJ6SK7a0UwL0NwwFJDhTY6Z9yEh8=;
        b=YW3Z0EXCxmFYSe4o3lPM9tiKBFYyQ54KDKv8LXctSzbrIMr//QF4DUFW4sLzaAsOWm
         hdczdWcgZnQZltRCub6nivew/oAN2cBRmzKOVl+5jXqcDXloIjPgZwGp5BpUIHOXSRL3
         8d12dVkWAItaCdQC4O4lSmDGGA0zwI0U9vu9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711540223; x=1712145023;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4FC6f2CiQL5W1YZBJ6SK7a0UwL0NwwFJDhTY6Z9yEh8=;
        b=E1O8qyfGG1rKo5MJhMDCo2AWNnPJJUo5O5qLQRVbiDQgm6EjdRr/vQR2vhMdjzOWE5
         Gm4tIXtXxfdXaaqAZMsZLckNUAfCYb5evRrRxp/aeb6ph5S+qYRqiOtGbDlV3KOvjuD8
         YwolB30B5lnpkZ2T64tgew8ePczvkbacdLui0xmSO/gx7zJ0CeuurwOOZe8xrewOyChC
         In5UkLnh/g+0hQbbb3JyBIfjHc0KzOHiH08A3Rg1hRJVD6U9XUsbWNNQ8Xg4zconTFwI
         kIqAoXkPkQHwVCfGdbWoDygHlP9vcrizn+ndmnZQ4H8vpNio2Wd0IJReHH2aWBxc5wFw
         IT2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkrqcVe1EhfdSFWuwdn7ce644pyIFMnrGWDoXccILHGUcB2G2qDQZmlAI83CqBQ9t8AQ02obPnHMzKDFLhkm1Rf0ngTuUJ
X-Gm-Message-State: AOJu0Yziy2XidXt+CfRohELB31M002gleAFnVCk4ycVKEnoxSAVv5dS4
	kOeMHNvncTfIeyjhsTVhGGx6tclcnr5y13HQ30pkl5v6nbT3zSOO8MeHAGuTmQY=
X-Google-Smtp-Source: AGHT+IHjrlueyINri3BcwMN7nzklq3D6QJVA6wmS9ETMB5MPCffXe1tqgCTZZJIf53/O2Hw5bsVZmw==
X-Received: by 2002:a17:906:a890:b0:a47:134d:2fc8 with SMTP id ha16-20020a170906a89000b00a47134d2fc8mr3629567ejb.10.1711540223416;
        Wed, 27 Mar 2024 04:50:23 -0700 (PDT)
Return-Path: <anthony.perard@cloud.com>
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id u1-20020a1709063b8100b00a46fbff47a6sm5322360ejf.168.2024.03.27.04.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 04:50:22 -0700 (PDT)
Date: Wed, 27 Mar 2024 11:50:21 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH-for-9.0 v2 05/19] hw/display: Restrict
 xen_register_framebuffer() call to Xen
Message-ID: <7e08a2d5-7d90-4d48-85e5-4c7e39d59c11@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-6-philmd@linaro.org>
X-TUID: WOj+iqmI01Ju

On Tue, Nov 14, 2023 at 03:38:01PM +0100, Philippe Mathieu-Daudé wrote:
> Only call xen_register_framebuffer() when Xen is enabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I don't think this patch is very useful but it's fine, so:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD
