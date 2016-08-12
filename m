Received: by 10.25.21.156 with SMTP id 28csp219828lfv;
        Fri, 12 Aug 2016 08:43:01 -0700 (PDT)
X-Received: by 10.55.36.131 with SMTP id k3mr17886947qkk.86.1471016581458;
        Fri, 12 Aug 2016 08:43:01 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f184si3621058qkd.219.2016.08.12.08.43.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Aug 2016 08:43:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYEbs-0001CX-LE
	for alex.bennee@linaro.org; Fri, 12 Aug 2016 11:43:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYEB6-0008Px-Fa
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 11:15:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYEB4-0006XS-Ii
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 11:15:19 -0400
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:34433)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYEB3-0006Ws-LE
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 11:15:18 -0400
Received: by mail-ua0-x22f.google.com with SMTP id k90so46666909uak.1
	for <qemu-devel@nongnu.org>; Fri, 12 Aug 2016 08:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BU2HdDnrW4vdKafaFWNycV01CL6nAbGPjB/1CbTWYIU=;
	b=U63NicvHPuWqiC+dtgc86r3jkSOhrqPjCXjFGsyZygnRFhO1YnFaVCapFAvPv9UFWA
	Fbj5p1JG8i5UmxC/44+cED4QBJG/BzoH6LBboxtXtBXHI5tf4TYmjh8UNRb0jy6AvbHV
	lJz0OllKYQHPsOEznn61ziEunx4+wE41a62Qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BU2HdDnrW4vdKafaFWNycV01CL6nAbGPjB/1CbTWYIU=;
	b=gttBxwrm1o5VMVmO5cJVXuz6Tjg/sL0iFwu9p3yXkPgvi3UiCdYufUWxc1w7K5KyEq
	/7Ifx51hx6y/o8jSDOzGQxkXuH2K6EZZTEYYD3TxF5ASkslXS/V9ExUYaHoR3Cb0JPpm
	mNNBnbGirNYOjvSQJ6e7j7n9Zc/MwE2eUA/hJeooXLBvja2E9GANea5qCvNzmt9jPYGS
	Lccj/yR2JJNd5gddkOa/tqIyW9Xb1+xnh50EJos7u+U9KZYDAsq4VnFbJ3M4gAeVefAK
	bBeWGHqoIex2I+cXNLVHm0BJP8syf9kjwTpO7+7/D1hKIZ+OQi9TWL9AwMkKjuHo6WO0
	alvQ==
X-Gm-Message-State: AEkoouvljCVxDh9Q1Y+93aZdS9rwB8DIGfJKON0cNc5rGRZ7Qkw4XVC+UoHPXIOiMZ1vrCygmoQpcNRxN3yfCuS1
X-Received: by 10.176.0.212 with SMTP id 78mr6352874uaj.107.1471004438164;
	Fri, 12 Aug 2016 05:20:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Fri, 12 Aug 2016 05:20:17 -0700 (PDT)
In-Reply-To: <CAFEAcA8HiOvUjK46NdDuUJd4hqzXMuF+M6XHhk_XDCw-5E+fgQ@mail.gmail.com>
References: <20160809190229.27871-1-bobby.prani@gmail.com>
	<20160809190229.27871-5-bobby.prani@gmail.com>
	<CAFEAcA8HiOvUjK46NdDuUJd4hqzXMuF+M6XHhk_XDCw-5E+fgQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2016 13:20:17 +0100
Message-ID: <CAFEAcA-Lmxqapg-EBYhuO2phuU11AZ6YqfDQT6c8uGXgQL2uBg@mail.gmail.com>
To: Pranith Kumar <bobby.prani@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-devel] [PATCH 5/5] target-arm: Fix warn about implicit
 conversion
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, "open list:ARM" <qemu-arm@nongnu.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LJobnLfc4WVq

On 11 August 2016 at 11:50, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 9 August 2016 at 20:02, Pranith Kumar <bobby.prani@gmail.com> wrote:
>> Clang warns about an implicit conversion as follows:
>>
>> /mnt/devops/code/qemu/target-arm/neon_helper.c:1075:1: warning: implicit conversion from 'int' to 'int8_t' (aka 'signed char') changes value from 128 to -128 [-Wconstant-conversion]
>> NEON_VOP_ENV(qrshl_s8, neon_s8, 4)
>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> /mnt/devops/code/qemu/target-arm/neon_helper.c:116:83: note: expanded from macro 'NEON_VOP_ENV'
>> uint32_t HELPER(glue(neon_,name))(CPUARMState *env, uint32_t arg1, uint32_t arg2) \
>>                                                                                   ^
>> /mnt/devops/code/qemu/target-arm/neon_helper.c:106:5: note: expanded from macro '\
>> NEON_VOP_BODY'
>>     NEON_DO##n; \
>>     ^~~~~~~~~~
>> <scratch space>:21:1: note: expanded from here
>> NEON_DO4
>> ^~~~~~~~
>> /mnt/devops/code/qemu/target-arm/neon_helper.c:93:5: note: expanded from macro 'NEON_DO4'
>>     NEON_FN(vdest.v1, vsrc1.v1, vsrc2.v1); \
>>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> /mnt/devops/code/qemu/target-arm/neon_helper.c:1054:23: note: expanded from macro 'NEON_FN'
>>             dest = (1 << (sizeof(src1) * 8 - 1)); \
>>                  ~  ~~^~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Fix it by casting to appropriate type.
>>
>> Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
>> ---
>>  target-arm/neon_helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target-arm/neon_helper.c b/target-arm/neon_helper.c
>> index 1f1844f..ebdf7c9 100644
>> --- a/target-arm/neon_helper.c
>> +++ b/target-arm/neon_helper.c
>> @@ -1051,7 +1051,7 @@ uint64_t HELPER(neon_qrshl_u64)(CPUARMState *env, uint64_t val, uint64_t shiftop
>>      if (tmp >= (ssize_t)sizeof(src1) * 8) { \
>>          if (src1) { \
>>              SET_QC(); \
>> -            dest = (1 << (sizeof(src1) * 8 - 1)); \
>> +            dest = (typeof(dest))(1 << (sizeof(src1) * 8 - 1)); \
>>              if (src1 > 0) { \
>>                  dest--; \
>>              } \
>
> A bit ugly but I guess it works. (The code is
> deliberately setting dest to "most negative integer
> that fits into src1 type".)
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Applied to master, thanks.

-- PMM
