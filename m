Received: by 10.25.159.19 with SMTP id i19csp152176lfe;
        Mon, 1 Feb 2016 08:23:10 -0800 (PST)
X-Received: by 10.194.87.201 with SMTP id ba9mr23563217wjb.128.1454343788815;
        Mon, 01 Feb 2016 08:23:08 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22e.google.com (mail-wm0-x22e.google.com. [2a00:1450:400c:c09::22e])
        by mx.google.com with ESMTPS id d132si15877927wmf.70.2016.02.01.08.23.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Feb 2016 08:23:08 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22e as permitted sender) client-ip=2a00:1450:400c:c09::22e;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22e as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22e.google.com with SMTP id 128so78992668wmz.1
        for <alex.bennee@linaro.org>; Mon, 01 Feb 2016 08:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=FCGpXbAUSQp/CSQ+eJLnpwi+BJtJROdJOI2268IzA4o=;
        b=WWcgh3fa760JrgYH6gX9SEu75Rm85Mg4YLbTKjhA/qYx1HOt1SipS7hd33mol7SkqZ
         PsChLYF4eepzmWZrp/hNwuKHWppHq1h7ap/cbcqmsBJPiz6Q0lT8sHDkotUYPA+yExrH
         7ONXpJEd5gc/e8Rl29YYbtnbGpbLwxtkw8hBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=FCGpXbAUSQp/CSQ+eJLnpwi+BJtJROdJOI2268IzA4o=;
        b=H2362iZV7AK1+SjgwKYsMkbGWEavhAhkQdCkmGQAfbbbOzPsRkVX6qvFAsoIF903aw
         BIIjOjDgOT/7aPV+nb2C4ipuN5C/WN8Q38Q0kkdDl856I4ehJ5HlGpeUkqIZ+Fq+2j4T
         kmcc/sfdG6OThyh1Hw7e1t6n3ILKdeLBe9/AqymBPSBMOIY/GpmMwvb5i+byflBkybxy
         uNnHtnufk3Fx3MjdUaWfusA+I7RpWbLthi5HAbgFyFAqn/sxxIsI/iDKrahVg7PJcOxR
         STbaZtSWjKLPX19nOF6rxd3+aW1D7iGbGRQ84+8K48qxBKfr2hzz8QAD+fH0o/ierACK
         IQYA==
X-Gm-Message-State: AG10YOQUR8DK96HT0MaRgJ1qwzkai0qE6YLTuF5PP1KUC+4TMhwIMbaJSRrmh7iXtHRIH/FFmAA=
X-Received: by 10.194.174.73 with SMTP id bq9mr23330643wjc.145.1454343788472;
        Mon, 01 Feb 2016 08:23:08 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id c185sm12213322wma.5.2016.02.01.08.23.05
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 01 Feb 2016 08:23:06 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v6 2/8] device_tree: introduce
 load_device_tree_from_sysfs
To: Rob Herring <robherring2@gmail.com>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
 <1454334712-12360-3-git-send-email-eric.auger@linaro.org>
 <CAL_JsqLdCLnOUcnZe+d9uXmWp6fneuwska28vAeaWi7VJ6sBiw@mail.gmail.com>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 alex.williamson@redhat.com, David Gibson <david@gibson.dropbear.id.au>,
 Thomas Lendacky <thomas.lendacky@amd.com>, thuth@redhat.com,
 b.reynal@virtualopensystems.com, Linaro Patches <patches@linaro.org>,
 Peter Crosthwaite <crosthwaitepeter@gmail.com>,
 Suravee Suthikulanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Christoffer Dall <christoffer.dall@linaro.org>
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56AF8657.6060303@linaro.org>
Date: Mon, 1 Feb 2016 17:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLdCLnOUcnZe+d9uXmWp6fneuwska28vAeaWi7VJ6sBiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: hY50OY6iPNRv

Hi Rob,
On 02/01/2016 05:15 PM, Rob Herring wrote:
> On Mon, Feb 1, 2016 at 7:51 AM, Eric Auger <eric.auger@linaro.org> wrote:
>> This function returns the host device tree blob from sysfs
>> (/proc/device-tree). It uses a recursive function inspired
>> from dtc read_fstree.
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>>
>> ---
>> v5 -> v6:
>> - fix some spelling mistakes
>> - error_report + exit replaced by error_setg
>> - const char *parent_node;
>> - use g_strdup_printf instead of g_strjoin
>> - add a doc comment for load_device_tree_from_sysfs
>> v1 -> v2:
>> - do not implement/expose read_fstree and load_device_tree_from_sysfs
>>   if CONFIG_LINUX is not defined (lstat is not implemeted in mingw)
>> - correct indentation in read_fstree
>> - use /proc/device-tree symlink instead of /sys/firmware/devicetree/base
>>   path (kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw)
>> - use g_file_get_contents in read_fstree
>> - introduce SYSFS_DT_BASEDIR macro and use strlen
>> - exit on error in load_device_tree_from_sysfs
>> - user error_setg
>>
>> RFC -> v1:
>> - remove runtime dependency on dtc binary and introduce read_fstree
>> ---
>>  device_tree.c                | 99 ++++++++++++++++++++++++++++++++++++++++++++
>>  include/sysemu/device_tree.h |  8 ++++
>>  2 files changed, 107 insertions(+)
>>
>> diff --git a/device_tree.c b/device_tree.c
>> index a9f5f8e..3797182 100644
>> --- a/device_tree.c
>> +++ b/device_tree.c
>> @@ -17,6 +17,9 @@
>>  #include <fcntl.h>
>>  #include <unistd.h>
>>  #include <stdlib.h>
>> +#ifdef CONFIG_LINUX
>> +#include <dirent.h>
>> +#endif
>>
>>  #include "qemu-common.h"
>>  #include "qemu/error-report.h"
>> @@ -117,6 +120,102 @@ fail:
>>      return NULL;
>>  }
>>
>> +#ifdef CONFIG_LINUX
>> +
>> +#define SYSFS_DT_BASEDIR "/proc/device-tree"
> 
> Use the sysfs path (/sys/firmware/device-tree/ IIRC) as this is just a
> symlink to sysfs and /proc is considered the legacy path.
I used the sysfs originally but I eventually found:
https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw
which states:

"Userspace must not use the /sys/firmware/devicetree/base
path directly, but instead should follow /proc/device-tree
symlink. It is possible that the absolute path will change
in the future, but the symlink is the stable ABI.
"

Do you confirm this statement is outdated.

Thank you in advance

Best Regards

Eric
> 
> Rob
> 
