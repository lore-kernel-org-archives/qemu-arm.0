Received: by 10.223.150.237 with SMTP id u100csp1112922wrb;
        Wed, 8 Nov 2017 02:36:34 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbcp8GbvcTTO6eZBoRuW82cCdciabOBi9KYoWQJlh5Htw1rW0HsLGj+o+aVMG1QZea19DY0
X-Received: by 10.157.0.172 with SMTP id w41mr20460oti.448.1510137394827;
        Wed, 08 Nov 2017 02:36:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510137394; cv=none;
        d=google.com; s=arc-20160816;
        b=RYDYZcnbPDi+RrZR1wv2TVuzKywSew8f7z8FgzUKyea1G0WixEzIAn5yt/FRZw0PM2
         tLzaYX05zsWdRxtIH35cFDxbl6iLQI+VJFNvdEXHR8sWxOsypsNaTN4A3YZCqQtOSmMn
         vEmb9prMZnPdhc/Sc6pvZMstrW1f6xNOj+MfC0YtP6idTCQlUhVVCKWxlWCTB3b+Gsbw
         fO9qpEWghKoufj3/VVTjn/6WOAYhVzMSFJvuwSniUemdC8QqTxvWZxZ0YvTQK8ipzwWK
         a1HwExgbJtIzSbAbwjenHp9s2JAbO7zTJuieEo9AFEPwf8ko5qKypb5dlg4UEkGmLdOM
         VJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=6F2sQEyM/aFdQWkJnDgId18JUuGTZ0uDWtNVNA3S5QE=;
        b=f3RpBnzPr8yxuL6yxooFRbgdRwmQPULxkO3z8CXU2JghO5MatrVueOiTn5mQ/RltwU
         Dr993Hv8hJC+ggAFcTaGOh3KQVKEKwExBrTlKLagt9YBaOtyW/CG3FSNv/LVK7LuKjM8
         5sQ/7KkYc8YFYcbYNS0Am6TSo8JcVvqzkKQJAf/b5f6MfQUUSnmFNtOcPB7Jl3cYnrd9
         cjZt1691foTeo0jbVlUZCTZEqprAOS+qcD4U2ixBNWvwWxbll9YJ1hRD5LWiVf+68Zxs
         /gRV8KKfmdpSqSc1GW+t9uCMBe1akfJU2j63BEU7DDWlc6pdiMVn4QsrLwyfCptGvvFD
         VouQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id q69si1760112oic.332.2017.11.08.02.36.34;
        Wed, 08 Nov 2017 02:36:34 -0800 (PST)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DAD414;
	Wed,  8 Nov 2017 02:36:34 -0800 (PST)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71BF03F3DF;
	Wed,  8 Nov 2017 02:36:33 -0800 (PST)
Date: Wed, 8 Nov 2017 10:36:31 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [RISU PATCH 00/10] Initial support for SVE
Message-ID: <20171108103630.GB8971@e103592.cambridge.arm.com>
References: <20171107150558.22131-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171107150558.22131-1-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: 7HIjbjW39476

On Tue, Nov 07, 2017 at 03:05:48PM +0000, Alex Bennée wrote:
> Hi,
> 
> These patches apply on-top of the last clean-up series:
> 
>   Subject: [RISU PATCH 0/7] Add @Group support and some aarch64.risu cleanups
>   Date: Tue, 31 Oct 2017 14:54:37 +0000
>   Message-Id: <20171031145444.13766-1-alex.bennee@linaro.org>
> 
> This series adds support for SVE to RISU. Most of the initial patches
> are plumbing changes to better support arch specific option flags
> (cleaning up a TODO in the process). I also needed to ensure configure
> actually honoured CPPFLAGS so it could be passed yet to be released
> headers.

Should there be a getauxval(AT_HWCAP) & HWCAP_SVE check in this series
somewhere?

I don't know enough about how RISU is structured to know whether/where
this is needed.

[...]

Cheers
---Dave
