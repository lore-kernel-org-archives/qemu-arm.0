Received: by 10.25.0.144 with SMTP id 138csp1810909lfa;
        Tue, 25 Apr 2017 04:05:07 -0700 (PDT)
X-Received: by 10.28.134.142 with SMTP id i136mr1488516wmd.14.1493118307137;
        Tue, 25 Apr 2017 04:05:07 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com. [2a00:1450:400c:c09::242])
        by mx.google.com with ESMTPS id d12si22863254wrd.163.2017.04.25.04.05.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:05:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) client-ip=2a00:1450:400c:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x242.google.com with SMTP id d79so24119135wmi.2;
        Tue, 25 Apr 2017 04:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oyGEyWEAmb+iJ9MJsLkNWszYCKjeg4mgzYkkbxworLE=;
        b=SmDkNyJrnMc9NQQYVWUizketvAsCq7TU3ndUgO8N/JM4KSdBcKG0kDthn0K5K17f+y
         7Dzq2IsCN9wJoMDHfz+y7KDG3CyItROmwPg882oVXgw1Q/Sea5mfBHgJK4Xla/AubKww
         ah6O1nTMd4ImEGZHrdEiwUGgTK/qpsJywxOtVIEPR9mXQ7UbEZZpFlnFsY1KaejQhDzo
         iojrU+n+TwqFKfr+BFA2xTCoOX7DMOgr6lV5PI6ttGRNVOkJKDAiGCEzUocHNsU6bVLs
         S7+cSJzI186SNMS1H2Lat+dMYdoXFtWCJwlK52GTUYZCv2QIHCMRWyXD0Ezd2z7o3p4Q
         f+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oyGEyWEAmb+iJ9MJsLkNWszYCKjeg4mgzYkkbxworLE=;
        b=YBaWNrwAuxcVi0Tj+t3ZQwCR6OFYg36HUdZU6mB8LiClWyE1zpvTbNshIxbOIKj38w
         EFF8unGsQkCe7WtWdgN2Z8GUF+iC2jL7KuPBTLnL0FI9uzImDQykfb0CvxQLiur7n6tN
         IXxzkzsdUk+FkISe6ANVC7YJaXklCypz4NBK5mAvb1mhM34L2HR7lgrQ3fdZPm2yk82z
         fqtuZXjpxKFFILKmA8ceUUdta+ysOA+qKhPFa9vMJurdLVPaKUWtEhgtZM8JOmG0kBRH
         CeJwOqmTwnbmFg9oovYu8+8bi/jtZbjJ3iRaLYBgm0hzzufoZDmB7MG+Zzq+5Aw2dT1z
         r+vA==
X-Gm-Message-State: AN3rC/6ZNZzIujMZiWnm9wzzrUTHmyjytH5tUFvr5ksAJ7xKRDsR6a5R
	8FWnJ+kmDpBU7oF4BI4=
X-Received: by 10.80.142.93 with SMTP id 29mr4646048edx.150.1493118306943;
        Tue, 25 Apr 2017 04:05:06 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id b30sm4910278edd.19.2017.04.25.04.05.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:05:06 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 06/13] tcg: add goto_ptr opcode
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
 <1493106839-10438-7-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <bb5e7db4-5e91-06cb-5902-c22309132951@twiddle.net>
Date: Tue, 25 Apr 2017 13:05:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493106839-10438-7-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: VTja3qOvaEN3

On 04/25/2017 09:53 AM, Emilio G. Cota wrote:
> @@ -1138,6 +1138,7 @@ void tcg_dump_ops(TCGContext *s)
>               }
>               switch (c) {
>               case INDEX_op_set_label:
> +            case INDEX_op_goto_tb:
>               case INDEX_op_br:
>               case INDEX_op_brcond_i32:
>               case INDEX_op_brcond_i64:

This is wrong, and causes crashes when dumping.  Nor should goto_ptr be here, 
so I don't know what you were after.


r~
