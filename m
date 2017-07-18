Received: by 10.25.44.15 with SMTP id s15csp5245210lfs;
        Mon, 17 Jul 2017 17:11:25 -0700 (PDT)
X-Received: by 10.55.203.68 with SMTP id d65mr155390qkj.222.1500336685631;
        Mon, 17 Jul 2017 17:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500336685; cv=none;
        d=google.com; s=arc-20160816;
        b=vzfPJA6SDfiHx0fY1XvWV5J973CeOkMuUKoyGeQL1U9W3evAWO2b2TOiujT/HfYUN8
         +s3DZfpU/zTrA6NK7G/hGTora9GyFwkpDWMUhkhwQfNcsBxdqPW5yC9Jn7FV7sgOlIfZ
         V9DEAU4V7GNs4EgU2cL0fKVKSOhwdZlw8Cj1HqF9b1bP6BYGZUj8Gu4TI5jx4Mm0Mn7T
         rDgaMxLYyZCQemjPsmBJHdch388xevi4APQDMRnstkN+LD7jDZWuBAF4ZZPiCP744oaz
         is+7Fq44jgYukVP6ncfni2HF/KmZd4iAAgxwNg7w8T6nBwa0KHzRj9ymX/he2jPYOoDF
         HETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=Sufmws1SQh1LV2dERbGl7QAtXOL/RnIL9A/dsjc3KZM=;
        b=IJvuZAP21ddT/h//r1tp2xqqtPTFW24H/zd83SiY/C4RUqQX7jGokuXtUx6TAPzoTD
         mp90BlVuXH6dPo8Gm7+pwr8KTpK2aqUvtHiDcOlVJzNAWRCIDpdZL21SaizGc9B9UO2X
         60QmrQfNwVtBrPdrsFxpNTEGRPH5nQxo0bfzsE33a71gpGb7UiXQmmRvPIntFcbIUYiy
         ddD9JabUOSW3VR4gNmeZM/aVXAxERR51kJrTpee8NwMExagthxMxrrIYHW4Icls85sss
         g8HUh6ZogNOuv2aW5QLks04s32oWATe13DYwHkemdEGP6bo5unKlc+Y0/VUt6tZtYQnu
         KPzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=12qMEPAJ;
       dkim=pass header.i=@messagingengine.com header.b=ejOtBTLd;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id o16si604758qtf.108.2017.07.17.17.11.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jul 2017 17:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=12qMEPAJ;
       dkim=pass header.i=@messagingengine.com header.b=ejOtBTLd;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4325C207C2;
	Mon, 17 Jul 2017 20:11:25 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Mon, 17 Jul 2017 20:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Sufmws1SQh1LV2d
	ERbGl7QAtXOL/RnIL9A/dsjc3KZM=; b=12qMEPAJtuACKK0j0jyn38AIfEg2Bj7
	KtziBi/4Fqdw4+6TM3TT2QCCXYhkHI+KhCY6HK1FVYvDNKSE8dTZvK5rr6C0+ftF
	RDbbMSHcgcBGHmz5uclB+Wh5GWyZwcGCAMSFrHIoy0vnFsEkOzCnnc3n9YrxDfir
	wJnxK5WI7IZI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=Sufmws1SQh1LV2dERbGl7QAtXOL/RnIL9A/dsjc3KZM=; b=ejOtBTLd
	r2vKrd8pszQsQoWaCfNIgQmcAFBLBxyngKE54J9lkiahsi5jG0+SNxiRbiDT7T5r
	+lX/6xsgYq7pnT1/zgJyQmDOyQEO1bCtTjg0VZL0YDJfdUwyJadU87xp3I5oqIez
	4t1NkDyzW1NtZm4Nj4E93+edfYFMrrqzTWcc+I8pZWxxsLdw/UfUH5KqNegfkl3h
	AFA6qdb8tF9pkj7M/mJciiS+ZdyGqYHi4xl18wWPYcIEjaaxQeShLZ8GH4RZvNnZ
	RwHlmdek7ZHoLJnicgMo0rk58Gja4JB1ZLKTJ9DWE7nYubAgwzRtdnrucSA0FU6C
	j6Wj7pgdfWfajg==
X-ME-Sender: <xms:LVJtWVCiVaxX0brr17NY9SnJpQ1a5M5WtwPSuDUQSofCCL7oTPbrGQ>
X-Sasl-enc: 8i/pQJ4fzTbNHMijgIleG8l35T+ckSc5vPZvVuBPKb0R 1500336684
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id EF6F324606;
	Mon, 17 Jul 2017 20:11:24 -0400 (EDT)
Date: Mon, 17 Jul 2017 20:11:24 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, rth@twiddle.net, qemu-devel@nongnu.org,
	"open list:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v3 5/6] target/arm: use gen_goto_tb for ISB handling
Message-ID: <20170718001124.GE30851@flamenco>
References: <20170711175937.23140-1-alex.bennee@linaro.org>
 <20170711175937.23140-6-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170711175937.23140-6-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: 2v0MGygPh4W9

On Tue, Jul 11, 2017 at 18:59:36 +0100, Alex Bennée wrote:
> While an ISB will ensure any raised IRQs happen on the next
> instruction it doesn't cause any to get raised by itself. We can
> therefor use a simple tb exit for ISB instructions and rely on the

s/therefor/therefore/

> exit_request check at the top of each TB to deal with exiting if
> needed.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Emilio G. Cota <cota@braap.org>

		E.
