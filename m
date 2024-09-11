Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp163485nji;
        Wed, 11 Sep 2024 06:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSuD1ZyBkPK+HDs/tn1I+T3NLhv3/r1Uv/TwLaAwzsZQ9id6r2UkItbAl4U/u96Y/UYdXt9WgurEnnaw==@linaro.org
X-Google-Smtp-Source: AGHT+IFCLb123plkbuwkGwuTA8e6urT92wtRX9wSgBBa2nu2Yk28GMxM1dK70mGswlghOGxDIduU
X-Received: by 2002:a05:6102:3f4b:b0:48f:4218:4d06 with SMTP id ada2fe7eead31-49bde2f8f77mr19793153137.28.1726062053486;
        Wed, 11 Sep 2024 06:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726062053; cv=none;
        d=google.com; s=arc-20240605;
        b=fmHlIUSaJVrzHfLz1i0c4S8PoYZlX0iyrDfhs0tk7k1fev0Svj6mw0umB2G3Q7bKVt
         HxawCvJFBaEE3VsDW/T4PQrJqC3mAOYUaHM9ocFiiKiGuguJoi/M0FOTChS+5dcQz+k5
         cpRHZceOquNdfZ6Wqlx7PNy9hVorbNuegfoUI2b8FVlS5WIl3nY1ISa9lJHdVpki/Voh
         V8Kuzd4dDZe4Lhi4yfXyZkOYLrYNaBZKGyGRcEgicycOQpBfpnIszFlJ1PhfBmAr5i75
         Q6yfT6wJgkEoJdjoceGEs1GZds5Xn2SPOoWBqOd+QaEo8kt7pgvVgmBpr6rdmvnizJOW
         q0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=A4cGYuzEcsU+H11W5DX5/hXv+/XV9V+6iflAKbWezCQ=;
        fh=hZV+jmzjzsdeENTJehiHwU3l0HWmOqLdC98kiJ179jY=;
        b=SpQCTZsBKmrifU3jjxAzIr5jNHZ90mwZAVRjRCVomjc7/1tAal8Y9v0qYfyQtPxIb9
         E5JtYsGHn+1ZTe4+UZBRL2mtAemdszlaiIbSqGfp50q4lvw/Z9DO43fNqb4KDF+frgQu
         aZHnR5tnVicHR2Wy6Yb3ISsW2CtGojYPfenLQKdYMitOAYrTaIGHc8x2LN+Wj2Jjigs7
         U8f17kP/EaMQilay/stRCyUEVBjPh7h4Zz5YSAG9b9oJ2cM1l9z/QOxbRe83NLRetk1t
         71FidbTxbURGtGGRgZccVK3PTQ23Uf+wjnBjZt7e8VXdzv1PYgWRe3HZ5rPEgSoWrlFI
         OZ9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PwgnRavr;
       spf=pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <peterx@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-49c16caa707si806261137.124.2024.09.11.06.40.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 06:40:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PwgnRavr;
       spf=pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726062053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A4cGYuzEcsU+H11W5DX5/hXv+/XV9V+6iflAKbWezCQ=;
	b=PwgnRavrCSkBydV8h7ly1eFoCBI8fAJOXIzwXKyfLlUFPS+ztiv/hoMjmMye1/ZYu29UuF
	xyY3eNxMoyAPDhltXDP8KJ56UNguaFu4TYk8TEb161NP19+Fd1ZKGLD+wIO3i2K/OxNPdR
	TvLsEGA8lKpOXqdEdieB44E39LSFSaE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-xA1SKCvUN9-dGS5QFflxAQ-1; Wed, 11 Sep 2024 09:40:52 -0400
X-MC-Unique: xA1SKCvUN9-dGS5QFflxAQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4582790fc3cso70233711cf.0
        for <alex.bennee@linaro.org>; Wed, 11 Sep 2024 06:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726062051; x=1726666851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4cGYuzEcsU+H11W5DX5/hXv+/XV9V+6iflAKbWezCQ=;
        b=YhgLPLaJyQJoTAG5wvYUJ+bA1eg+bijU10x9F4FySYYULBnBy97ChxHpDFdaNLuIjf
         m35q2TAX5RMUHNVpcQGakL+p9D2+mG+INkHSpDUVaJRqOiGtcUoXPVizsHiX7KA0oFsU
         kOh1KsHrgd4vM/zzbcln62pBzHr2oAqCx9sAKyIy2dwWJgYixZpb67vV5QTD5xR1+g34
         D7tYNGJynADeKaYRlDLR7hULK5HqBXIbeObISx3laCXW0Zg/kdUWTMGUV04QLlVqk0Eq
         ou9IFO+JgERtjzaGkuC84e9j5leDe208cba6yRdU0eQywH8Bd2VY3TIp0h97t8G4e0v+
         ntcw==
X-Forwarded-Encrypted: i=1; AJvYcCXEAGca+768HudmYV3dDbPTTE1coZObIs3RVTgrYtj6H4Xy1dgqkRzJ+GJB6krFs0xK4wdiZL86ZXuAzg==@linaro.org
X-Gm-Message-State: AOJu0YxIiIR8FNYrtAq0GgSFUJ710Qb9pbVN2e/BkdgmAyuxnLqtHhg+
	3BF7kORHOYlhM8QGFfPgtG7VcvRvs9Kn26wLPRvSyhm89mM3B3XYH1tIwUskfHTqYPobg98mmmT
	83D3kosOslUBdFWYkoK13m0y+KjMeVF5OKT2z1X9Ov0OTj9bZc1L+lQ==
X-Received: by 2002:ac8:57c4:0:b0:458:59e3:2b52 with SMTP id d75a77b69052e-45859e332abmr16949701cf.55.1726062051251;
        Wed, 11 Sep 2024 06:40:51 -0700 (PDT)
X-Received: by 2002:ac8:57c4:0:b0:458:59e3:2b52 with SMTP id d75a77b69052e-45859e332abmr16948861cf.55.1726062049492;
        Wed, 11 Sep 2024 06:40:49 -0700 (PDT)
Return-Path: <peterx@redhat.com>
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45822e60974sm41358491cf.8.2024.09.11.06.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 06:40:48 -0700 (PDT)
Date: Wed, 11 Sep 2024 09:40:45 -0400
From: Peter Xu <peterx@redhat.com>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
	WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
	Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Jesper Devantier <foss@defmacro.it>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>, kvm@vger.kernel.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>, Helge Deller <deller@gmx.de>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bmeng.cn@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>, Klaus Jensen <its@irrelevant.dk>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 21/39] migration: replace assert(false) with
 g_assert_not_reached()
Message-ID: <ZuGd3bcawih4bN9Z@x1n>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-22-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240910221606.1817478-22-pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-TUID: z7Gm9R1GF/Fv

On Tue, Sep 10, 2024 at 03:15:48PM -0700, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu
