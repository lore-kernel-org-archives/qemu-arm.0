Received: by 10.25.159.19 with SMTP id i19csp48016lfe;
        Mon, 1 Feb 2016 05:12:07 -0800 (PST)
X-Received: by 10.194.173.65 with SMTP id bi1mr22286230wjc.110.1454332327858;
        Mon, 01 Feb 2016 05:12:07 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com. [2a00:1450:400c:c09::22d])
        by mx.google.com with ESMTPS id j13si14887288wmd.85.2016.02.01.05.12.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Feb 2016 05:12:07 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) client-ip=2a00:1450:400c:c09::22d;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22d.google.com with SMTP id l66so70498838wml.0
        for <alex.bennee@linaro.org>; Mon, 01 Feb 2016 05:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=vH1S3O300hqkusj1IrdjJPxDgyKR4MvbMuhpwelixxs=;
        b=Gv/wWsHB36kKZ0j2iM25fqSo5vyN2qvNGYTwLNhlsAFkNEY8NcfXhFU+8kaXoxnCsk
         cVfZii4DsveJSoKo4LxsnHnfwaVkrkW9yN2LRDFrHP93YWgA6Ct2Oc9GYYBDs4Uj6OE2
         lf0WkzHo5aQHFsCWTofEx2qMXuB7qUOvnlyrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=vH1S3O300hqkusj1IrdjJPxDgyKR4MvbMuhpwelixxs=;
        b=J0QpDDyTtUVfbHH7c70E/2NKTPX2GAg0MHcH0C3L3ZeNPb0p3ysDSZEj49d3ZA7kTJ
         U5MeekWPI+wnE2g9m3+ojDTkjdVH1Mvid22qlKCAFamDTFNTRSjEuA2PxQsjgAyVhJxr
         qKc81NV1LSLfO0wNBVZ4+8dbO3U9hbBkR7jqWpSMYZSuVOfwyIXE4s/4sGqaWgynvESg
         1ooP+vawIIfhb4jcWqO1wWTKFYtkHdF4oubq5vwCgIYvJdTBSNo6hRQK63JR5eEIk6OP
         VS+c3+pXTqN/WznH5G9bpFkSXGtvILIjN02sphs00SjYguRA5HMGJ8ze1zxQTSE0+xb3
         I4Zw==
X-Gm-Message-State: AG10YOSgnMAcJAr4/YlkeCopbb3HSvqoTdyOwS/3Oi8zdSqxw/khqtITVLLFZqKswu52mFhZMZA=
X-Received: by 10.194.85.161 with SMTP id i1mr25782951wjz.95.1454332327583;
        Mon, 01 Feb 2016 05:12:07 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id 73sm11477003wmm.7.2016.02.01.05.12.04
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 01 Feb 2016 05:12:06 -0800 (PST)
Subject: Re: [PATCH v5 2/8] device_tree: introduce load_device_tree_from_sysfs
To: Peter Maydell <peter.maydell@linaro.org>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
 <1453130204-655-3-git-send-email-eric.auger@linaro.org>
 <CAFEAcA-9+muP4TjQnLk2XPAZsf=wRzsLSQbGuQhqrTxZpsz2xQ@mail.gmail.com>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Peter Crosthwaite <crosthwaitepeter@gmail.com>,
 Patch Tracking <patches@linaro.org>,
 Christoffer Dall <christoffer.dall@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Baptiste Reynal <b.reynal@virtualopensystems.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 thomas.lendacky@amd.com
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56AF5991.9030301@linaro.org>
Date: Mon, 1 Feb 2016 14:11:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-9+muP4TjQnLk2XPAZsf=wRzsLSQbGuQhqrTxZpsz2xQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: g24zwOUUXG4D

Hi Peter,
On 01/25/2016 03:13 PM, Peter Maydell wrote:
> On 18 January 2016 at 15:16, Eric Auger <eric.auger@linaro.org> wrote:
>> This function returns the host device tree blob from sysfs
>> (/proc/device-tree). It uses a recursive function inspired
>> from dtc read_fstree.
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>>
>> ---
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
>>  device_tree.c                | 100 +++++++++++++++++++++++++++++++++++++++++++
>>  include/sysemu/device_tree.h |   3 ++
>>  2 files changed, 103 insertions(+)
>>
>> diff --git a/device_tree.c b/device_tree.c
>> index a9f5f8e..b262c2d 100644
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
>> @@ -117,6 +120,103 @@ fail:
>>      return NULL;
>>  }
>>
>> +#ifdef CONFIG_LINUX
>> +
>> +#define SYSFS_DT_BASEDIR "/proc/device-tree"
>> +
>> +/**
>> + * read_fstree: this function is inspired from dtc read_fstree
>> + * @fdt: preallocated fdt blob buffer, to be populated
>> + * @dirname: directory to scan under SYSFS_DT_BASEDIR
>> + * the search is recursive and the tree is searched down to the
>> + * leafs (property files).
> 
> "leaves"
OK
> 
>> + *
>> + * the function self-asserts in case of error
> 
> "asserts"
OK
> 
>> + */
>> +static void read_fstree(void *fdt, const char *dirname)
>> +{
>> +    DIR *d;
>> +    struct dirent *de;
>> +    struct stat st;
>> +    const char *root_dir = SYSFS_DT_BASEDIR;
>> +    char *parent_node;
>> +
>> +    if (strstr(dirname, root_dir) != dirname) {
>> +        error_report("%s: %s must be searched within %s",
>> +                     __func__, dirname, root_dir);
>> +        exit(1);
> 
> Why does this one error_report and exit but other errors below use
> error_setg?
replaced with error_setg(&error_fatal, ...)
> 
>> +    }
>> +    parent_node = (char *)&dirname[strlen(SYSFS_DT_BASEDIR)];
> 
> What causes us to need this cast to char* ?
I changed parent_node to a const char * instead of char*
> 
>> +
>> +    d = opendir(dirname);
>> +    if (!d) {
>> +        error_setg(&error_fatal, "%s cannot open %s", __func__, dirname);
> 
> You need to return here (and similarly to bail out properly
> in the other error paths below).
> 
>> +    }
>> +
>> +    while ((de = readdir(d)) != NULL) {
>> +        char *tmpnam;
>> +
>> +        if (!g_strcmp0(de->d_name, ".")
>> +            || !g_strcmp0(de->d_name, "..")) {
>> +            continue;
>> +        }
>> +
>> +        tmpnam = g_strjoin("/", dirname, de->d_name, NULL);
>> +
>> +        if (lstat(tmpnam, &st) < 0) {
>> +            error_setg(&error_fatal, "%s cannot lstat %s", __func__, tmpnam);
>> +        }
>> +
>> +        if (S_ISREG(st.st_mode)) {
>> +            gchar *val;
>> +            gsize len;
>> +
>> +            if (!g_file_get_contents(tmpnam, &val, &len, NULL)) {
>> +                error_setg(&error_fatal, "%s not able to extract info from %s",
>> +                           __func__, tmpnam);
>> +            }
>> +
>> +            if (strlen(parent_node) > 0) {
>> +                qemu_fdt_setprop(fdt, parent_node,
>> +                                 de->d_name, val, len);
>> +            } else {
>> +                qemu_fdt_setprop(fdt, "/", de->d_name, val, len);
>> +            }
>> +            g_free(val);
>> +        } else if (S_ISDIR(st.st_mode)) {
>> +            char *node_name;
>> +
>> +            node_name = g_strdup_printf("%s/%s",
>> +                                        parent_node, de->d_name);
> 
> I don't mind whether we use g_strjoin("/",...) or g_strdup_printf("%s/%s", ...)
> to glue together strings with a '/' between them, but can we not use
> both methods in the same function, please?
ok
> 
>> +            qemu_fdt_add_subnode(fdt, node_name);
>> +            g_free(node_name);
>> +            read_fstree(fdt, tmpnam);
>> +        }
>> +
>> +        g_free(tmpnam);
>> +    }
>> +
>> +    closedir(d);
>> +}
>> +
>> +/* load_device_tree_from_sysfs: extract the dt blob from host sysfs */
>> +void *load_device_tree_from_sysfs(void)
>> +{
>> +    void *host_fdt;
>> +    int host_fdt_size;
>> +
>> +    host_fdt = create_device_tree(&host_fdt_size);
>> +    read_fstree(host_fdt, SYSFS_DT_BASEDIR);
>> +    if (fdt_check_header(host_fdt)) {
>> +        error_setg(&error_fatal,
>> +                   "%s host device tree extracted into memory is invalid",
>> +                   __func__);
> 
> Should we free the created device tree and return NULL here?
> 
>> +    }
>> +    return host_fdt;
>> +}
>> +
>> +#endif /* CONFIG_LINUX */
>> +
>>  static int findnode_nofail(void *fdt, const char *node_path)
>>  {
>>      int offset;
>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>> index 359e143..fdf25a4 100644
>> --- a/include/sysemu/device_tree.h
>> +++ b/include/sysemu/device_tree.h
>> @@ -16,6 +16,9 @@
>>
>>  void *create_device_tree(int *sizep);
>>  void *load_device_tree(const char *filename_path, int *sizep);
>> +#ifdef CONFIG_LINUX
>> +void *load_device_tree_from_sysfs(void);
> 
> Can we have a doc comment for a new global function, please?
sure

Thanks

Eric
> 
>> +#endif
>>
>>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>>                       const char *property, const void *val, int size);
>> --
>> 1.9.1
> 
> thanks
> -- PMM
> 
