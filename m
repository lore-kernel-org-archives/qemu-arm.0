Received: by 10.25.159.19 with SMTP id i19csp154515lfe;
        Mon, 1 Feb 2016 08:27:26 -0800 (PST)
X-Received: by 10.37.8.5 with SMTP id 5mr12771262ybi.179.1454344046157;
        Mon, 01 Feb 2016 08:27:26 -0800 (PST)
Return-Path: <robherring2@gmail.com>
Received: from mail-yk0-x22c.google.com (mail-yk0-x22c.google.com. [2607:f8b0:4002:c07::22c])
        by mx.google.com with ESMTPS id d65si11372723ywf.23.2016.02.01.08.27.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Feb 2016 08:27:26 -0800 (PST)
Received-SPF: pass (google.com: domain of robherring2@gmail.com designates 2607:f8b0:4002:c07::22c as permitted sender) client-ip=2607:f8b0:4002:c07::22c;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of robherring2@gmail.com designates 2607:f8b0:4002:c07::22c as permitted sender) smtp.mailfrom=robherring2@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-yk0-x22c.google.com with SMTP id z7so79520634yka.3;
        Mon, 01 Feb 2016 08:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=7MRUIw+Uobw1CWgphKlRDJRbGBkqlYIok6xXowYtEr8=;
        b=rHhRfsxEp5RRwadONlj12leNLhnw1vYdhGtPsJgGDxaj9AmQlLzfH1z7DX4xmHVvVq
         gMngfEpOuJXgLBt3iOMIQ6zFLDu5RuWU13GQeHUvN4cgO67l5Q4WZ5jNcLBLEm8rgKd+
         nFHHnbmd6EzqEhQZrSkZ0LFIXr+hEZTpMY2AFgtlYJIQZj4FZ0M5x9tvbV5pT2zv85Gq
         sD69T1O4wKcp7MCdBuw+VVx3KPoNWPdHiSKtPWWGv8R36vo8qISmuNn+jVVHYJjdpHaT
         7IRpWaqkjxrOiauq2to6yTOkpNm9bvC0rgm5is1GtBKeGA6c3ASP9L+mCiEsxM+JXpUi
         S4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=7MRUIw+Uobw1CWgphKlRDJRbGBkqlYIok6xXowYtEr8=;
        b=Gkf+xR9KeS9lwwEMeN3DTa3FjUeh15Lj1FxxcqYjI9Jl7aATyHBnAgI2aA0C8cWbiy
         84k347x5EUSCtaCsndB4kSi4vuC5yV32ituDBhV5YgRWrOfEYWjLbI4IL/wrXlkhqKqL
         LDCFAMh9XeT98TEFJVWT5IpY70jh4/q0hKcfd7FTIyH5UN1YkgAP3ldWbBhgSKK8M/kU
         XSTPNRDspjswS3GROKEDD/NVGuuqbjgNP1qaE8mJWY8yt2uYA7mKkWUYt2cDOpTyxyCo
         tjPnlv+PwX3YtMkFslmFKQqRh159j8MT46B7py+iHwTxYMq0t8sCroPLum75PZoxq6Si
         tGTQ==
X-Gm-Message-State: AG10YOSspR7NEfbyMgFNLOfOLi5s7jGOfT7Zff3R0206tpj5mc1zdQAhT6RCRAXSakSJv9jVmoGvl9BNSmZq8g==
X-Received: by 10.129.85.85 with SMTP id j82mr11415272ywb.28.1454344045677;
 Mon, 01 Feb 2016 08:27:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.129.153.19 with HTTP; Mon, 1 Feb 2016 08:27:06 -0800 (PST)
In-Reply-To: <56AF8657.6060303@linaro.org>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
 <1454334712-12360-3-git-send-email-eric.auger@linaro.org> <CAL_JsqLdCLnOUcnZe+d9uXmWp6fneuwska28vAeaWi7VJ6sBiw@mail.gmail.com>
 <56AF8657.6060303@linaro.org>
From: Rob Herring <robherring2@gmail.com>
Date: Mon, 1 Feb 2016 10:27:06 -0600
Message-ID: <CAL_Jsq+g2NpY=sEQURo4nk-F_AkJTvKdbRY=yx=Yj=51gTQYDw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v6 2/8] device_tree: introduce load_device_tree_from_sysfs
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org, 
	Peter Maydell <peter.maydell@linaro.org>, alex.williamson@redhat.com, 
	David Gibson <david@gibson.dropbear.id.au>, Thomas Lendacky <thomas.lendacky@amd.com>, thuth@redhat.com, 
	b.reynal@virtualopensystems.com, Linaro Patches <patches@linaro.org>, 
	Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
	Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Christoffer Dall <christoffer.dall@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: VxFuhU0P7MD5

On Mon, Feb 1, 2016 at 10:22 AM, Eric Auger <eric.auger@linaro.org> wrote:
> Hi Rob,
> On 02/01/2016 05:15 PM, Rob Herring wrote:
>> On Mon, Feb 1, 2016 at 7:51 AM, Eric Auger <eric.auger@linaro.org> wrote:
>>> This function returns the host device tree blob from sysfs
>>> (/proc/device-tree). It uses a recursive function inspired
>>> from dtc read_fstree.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>>>
>>> ---
>>> v5 -> v6:
>>> - fix some spelling mistakes
>>> - error_report + exit replaced by error_setg
>>> - const char *parent_node;
>>> - use g_strdup_printf instead of g_strjoin
>>> - add a doc comment for load_device_tree_from_sysfs
>>> v1 -> v2:
>>> - do not implement/expose read_fstree and load_device_tree_from_sysfs
>>>   if CONFIG_LINUX is not defined (lstat is not implemeted in mingw)
>>> - correct indentation in read_fstree
>>> - use /proc/device-tree symlink instead of /sys/firmware/devicetree/base
>>>   path (kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw)
>>> - use g_file_get_contents in read_fstree
>>> - introduce SYSFS_DT_BASEDIR macro and use strlen
>>> - exit on error in load_device_tree_from_sysfs
>>> - user error_setg
>>>
>>> RFC -> v1:
>>> - remove runtime dependency on dtc binary and introduce read_fstree
>>> ---
>>>  device_tree.c                | 99 ++++++++++++++++++++++++++++++++++++++++++++
>>>  include/sysemu/device_tree.h |  8 ++++
>>>  2 files changed, 107 insertions(+)
>>>
>>> diff --git a/device_tree.c b/device_tree.c
>>> index a9f5f8e..3797182 100644
>>> --- a/device_tree.c
>>> +++ b/device_tree.c
>>> @@ -17,6 +17,9 @@
>>>  #include <fcntl.h>
>>>  #include <unistd.h>
>>>  #include <stdlib.h>
>>> +#ifdef CONFIG_LINUX
>>> +#include <dirent.h>
>>> +#endif
>>>
>>>  #include "qemu-common.h"
>>>  #include "qemu/error-report.h"
>>> @@ -117,6 +120,102 @@ fail:
>>>      return NULL;
>>>  }
>>>
>>> +#ifdef CONFIG_LINUX
>>> +
>>> +#define SYSFS_DT_BASEDIR "/proc/device-tree"
>>
>> Use the sysfs path (/sys/firmware/device-tree/ IIRC) as this is just a
>> symlink to sysfs and /proc is considered the legacy path.
> I used the sysfs originally but I eventually found:
> https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw
> which states:
>
> "Userspace must not use the /sys/firmware/devicetree/base
> path directly, but instead should follow /proc/device-tree
> symlink. It is possible that the absolute path will change
> in the future, but the symlink is the stable ABI.
> "
>
> Do you confirm this statement is outdated.

Ah, no. My memory is just wrong. NM.

Rob
